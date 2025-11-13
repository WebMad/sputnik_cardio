package com.sputnikdev.cardio

import android.app.Application
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.embedding.engine.dart.DartExecutor
import io.flutter.embedding.engine.FlutterEngineCache

class MyApplication : Application() {
    lateinit var flutterEngine: FlutterEngine

    override fun onCreate() {
        super.onCreate()
        // Создание движка Flutter один раз на всё приложение
        flutterEngine = FlutterEngine(this)
        // Можно подготовить начальный маршрут (начальную страницу)
        flutterEngine.navigationChannel.setInitialRoute("/")
        flutterEngine.dartExecutor.executeDartEntrypoint(
            DartExecutor.DartEntrypoint.createDefault()
        )

        // Кэшируем под ключом "my_engine_id"
        FlutterEngineCache
            .getInstance()
            .put("my_engine_id", flutterEngine)
    }
}
