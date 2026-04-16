allprojects {
    repositories {
        google()
        mavenCentral()
    }
}

val newBuildDir: Directory =
    rootProject.layout.buildDirectory
        .dir("../../build")
        .get()
rootProject.layout.buildDirectory.value(newBuildDir)

subprojects {
    val newSubprojectBuildDir: Directory = newBuildDir.dir(project.name)
    project.layout.buildDirectory.value(newSubprojectBuildDir)
}
subprojects {
    project.evaluationDependsOn(":app")
}

subprojects {
    val forceAndroidCompileSdk: () -> Unit = force@{
        val androidExtension = extensions.findByName("android") ?: return@force

        runCatching {
            val setCompileSdk = androidExtension.javaClass.methods.firstOrNull {
                it.name == "setCompileSdk" && it.parameterCount == 1
            }

            val setCompileSdkVersion = androidExtension.javaClass.methods.firstOrNull {
                it.name == "setCompileSdkVersion" && it.parameterCount == 1
            }

            when {
                setCompileSdk != null -> setCompileSdk.invoke(androidExtension, 35)
                setCompileSdkVersion != null -> setCompileSdkVersion.invoke(androidExtension, 35)
                else -> Unit
            }
        }
    }

    if (state.executed) {
        forceAndroidCompileSdk()
    } else {
        afterEvaluate {
            forceAndroidCompileSdk()
        }
    }
}

tasks.register<Delete>("clean") {
    delete(rootProject.layout.buildDirectory)
}
