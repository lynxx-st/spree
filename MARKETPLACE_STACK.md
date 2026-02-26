# Marketplace Stack (Spree + Next.js)

This repository is configured to run:

- Spree backend (`http://localhost:3000`)
- Next.js storefront (`http://localhost:3001`)
- PostgreSQL

## 1. Configure environment

Create a root `.env` file:

```bash
cp .env.example .env
```

Set `SPREE_PUBLISHABLE_KEY` in `.env`.

Generate/get a key from the running backend:

```bash
docker compose exec -T spree bundle exec rails runner \
  "store=Spree::Store.default; key=Spree::ApiKey.where(store: store, key_type: :publishable).first_or_create!(name: 'Next.js Starter'); puts key.token"
```

## 2. Start everything

```bash
docker compose up -d --build
```

## 3. Load sample data

```bash
docker compose exec -T spree bundle exec rake spree:load_sample_data
```

## Notes

- The storefront is included as a git submodule at `storefront/`.
- `spree_multi_vendor` currently targets legacy Spree API v2 internals and fails on this Spree 5 stack during boot/asset precompile.
