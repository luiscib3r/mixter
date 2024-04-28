create type public.llm_provider_type as enum ('openai', 'groq', 'ollama');

create table public.llm_provider (
    "id" uuid not null default gen_random_uuid(),
    "name" character varying not null,
    "description" text not null,
    "url" text not null,
    "web" text not null,
    "type" llm_provider_type not null,
    "created_at" timestamp with time zone not null default now()
);


alter table public.llm_provider enable row level security;

CREATE UNIQUE INDEX llm_provider_pkey ON public.llm_provider USING btree (id);

alter table public.llm_provider add constraint "llm_provider_pkey" PRIMARY KEY using index "llm_provider_pkey";

grant references on table public.llm_provider to "authenticated";
grant select on table public.llm_provider to "authenticated";
create policy "select_llm_provider"
on public.llm_provider
as permissive
for select
to authenticated
using (true);


