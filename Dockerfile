# Etapa 1: Construcción (Build)
FROM eclipse-temurin:17-jdk-alpine AS build
WORKDIR /app

# Copiar el wrapper de Maven y el archivo de configuración
COPY mvnw .
COPY .mvn .mvn
COPY pom.xml .

# Copiar el código fuente
COPY src src

# Dar permisos de ejecución al wrapper de Maven y compilar el proyecto
RUN chmod +x ./mvnw
RUN ./mvnw clean package -DskipTests

# Etapa 2: Ejecución (Run)
FROM eclipse-temurin:17-jre-alpine
WORKDIR /app

# Copiar el archivo .jar generado desde la etapa de construcción
COPY --from=build /app/target/*.jar app.jar

# Exponer el puerto por defecto (Render inyectará su propio puerto, pero es buena práctica declararlo)
EXPOSE 8080

# Comando para ejecutar la aplicación
ENTRYPOINT ["java", "-jar", "app.jar"]