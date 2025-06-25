# art_seeker

Art seeker app demo.

## 1. GitFlow
<p> Branches: main.
<p> Commit name structure: description
<p> Merge request should contain no more than 40 files

## 2. Architecture
<p> Clean Architecture + BloC
<p> Dependency Injection: GetIt
<p> Domain layer: models, repositories.
<p> Data layer: mappers from DTO to domain model, implementations of repositories.
<p> Presentation layer: screens + bloc

## 3. Project structure
<p> Modules: di, data, navigation, presentation, etc.
<p> For presentation layer every feature is a separate module.

## 4. Code Development Rules
<p> Lint rules described in analysis_options.yaml

## 5. Asynchrony support
<p> Flutter Async, rxdart

## 6. Abstractions for data sources and data access
<p> Repositories are responsible for specific services (e.g., art repository).
<p> They work with DTO models and are also responsible for gathering data from data sources,
aggregating it, and mapping it to the corresponding domain layer models.
<p> Abstract base classes defined in the domain layer.

## 7. Presentation layer abstractions
<p> Base and frequently used widgets are stored in `common` directory.
<p> Base widget for screens is Scaffold.
<p> Navigation is implemented using Auto Route
<p> Navigation on BLoC event is done from the BLoC object itself without BuildContext,
router is stored in DI container and is injected in BLoC via constructor.

## 8. Logging
<p> Dio interceptors logging every request and response data

## 9. Approach for working with UI
<p> One file = one widget.
<p> Screen widget contains BlocProviders.

## 10. Supported platforms
<p> Mobile - iOS and Android

## 11. Demo video


https://github.com/user-attachments/assets/e5fb48b6-2f4b-4238-bb91-cf064add0761

