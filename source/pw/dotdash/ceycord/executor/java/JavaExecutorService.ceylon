import pw.dotdash.ceycord.executor.service {
    ExecutorService,
    ExecutorPool
}
import java.util.concurrent {
    Executors
}

service (`interface ExecutorService`)
shared class JavaExecutorService() satisfies ExecutorService {

    shared actual ExecutorPool newExecutorPool(Integer threads) =>
            JavaExecutorPool(threads == 1 then Executors.newSingleThreadScheduledExecutor() else Executors.newScheduledThreadPool(threads));
}