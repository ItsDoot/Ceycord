import ceylon.promise {
    Promise,
    Deferred
}
import ceylon.time.base {
    UnitOfTime,
    UnitOfHour,
    UnitOfMinute,
    UnitOfSecond,
    UnitOfMillisecond
}

import java.util.concurrent {
    ScheduledExecutorService,
    TimeUnit,
    CompletableFuture
}

import pw.dotdash.ceycord.api.executor {
    ExecutorPool
}

shared class JavaExecutorPool(delegate) satisfies ExecutorPool {

    shared ScheduledExecutorService delegate;

    shared actual void shutdown() {
        delegate.shutdown();
    }

    shared actual Boolean active => !delegate.terminated;

    shared actual Promise<Result> fetch<Result>(Result() task)
            given Result satisfies Object {
        value deferred = Deferred<Result>();

        void apply(Result? result, Throwable? ex) {
            if (exists result) {
                deferred.fulfill(result);
                return;
            }
            if (exists ex) {
                deferred.reject(ex);
            }
        }

        CompletableFuture.supplyAsync<Result>(task, (task) => delegate.execute(task)).whenComplete(apply);

        return deferred.promise;
    }

    shared actual void submitDelayed(Anything() task, Integer delay, UnitOfTime unit) {
        value timeUnit = convertTimeUnits(unit);
        delegate.schedule(task, delay, timeUnit);
    }

    shared actual void submitPeriodic(Anything() task, Integer initialDelay, Integer period, UnitOfTime unit) {
        value timeUnit = convertTimeUnits(unit);
        delegate.scheduleAtFixedRate(task, initialDelay, period, timeUnit);
    }

    TimeUnit convertTimeUnits(UnitOfTime unit) =>
            switch (unit)
            case (is UnitOfHour) TimeUnit.hours
            case (is UnitOfMinute) TimeUnit.minutes
            case (is UnitOfSecond) TimeUnit.seconds
            case (is UnitOfMillisecond) TimeUnit.milliseconds;
}