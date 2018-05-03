import ceylon.promise {
    Promise
}
import ceylon.time.base {
    UnitOfTime
}

shared interface ExecutorPool {

    shared formal void shutdown() ;

    shared formal Boolean active;

    "Executes a one-shot [[Promise]]."
    shared formal Promise<Result> fetch<Result>(Result() task) given Result satisfies Object;

    "Executes a one-shot [[Promise]] that runs after the given [[delay]]."
    shared formal void submitDelayed(Anything() task, Integer delay, UnitOfTime unit) ;

    "Executes a periodic [[Promise]] that runs periodically every [[period]], after an initial delay of [[initialDelay]]."
    shared formal void submitPeriodic(Anything() task, Integer initialDelay, Integer period, UnitOfTime unit) ;
}