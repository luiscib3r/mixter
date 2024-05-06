# mixter

Mixter is a ChatGPT like app to tests LLM models. It's a Flutter web and mobile app that uses Supabase as backend. The app is under development and it's not ready for production.

## Setup development environment

1. Install [Flutter](https://docs.flutter.dev/get-started/install)
2. Install `melos`

```bash
dart pub global activate melos
```

3. Install dependencies

```bash
melos bootstrap
```

4. Setup supabase backend

* Install [supabase CLI](https://github.com/supabase/cli?tab=readme-ov-file#getting-started)

* Go to supabase package

```bash
cd packages/mixter_supabase
```

* Run the following command to setup supabase backend local

(You must be have docker installed and running)

```bash
supabase start
```

* Also, you can deploy the backend to supabase cloud

Link the project

```bash
supabase link --project-ref <project-id>
```

Deploy database schema

```bash
supabase db push
```

> Take a look at seed.sql file to see the initial data for llm providers and models

---

5. Setup environment variables

Go to `env` folder and copy `example.env.json` to `env.json` and fill in the values.

6. Run the app

```bash
flutter run --dart-define-from-file env/env.json
```

7. Build release
  
```bash
flutter build web --dart-define-from-file env/env.json
```

```bash
flutter build apk --dart-define-from-file env/env.json
```

> This project is under development, so it may have some bugs and missing features. Feel free to contribute to the project. For questions, you can open an issue or contact me on [Twitter](https://x.com/luiscib3r).

