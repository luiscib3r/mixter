create table public.llm_model (
    "id" uuid not null default gen_random_uuid(),
    "model_id" character varying not null,
    "name" character varying not null,
    "description" text not null,
    "context" integer not null,
    "llm_provider_id" uuid not null,
    "created_at" timestamp with time zone not null default now()
);


alter table public.llm_model enable row level security;

CREATE UNIQUE INDEX llm_model_pkey ON public.llm_model USING btree (id);
CREATE INDEX llm_model_provider_key ON public.llm_model USING btree (llm_provider_id);

alter table public.llm_model add constraint "llm_model_pkey" PRIMARY KEY using index "llm_model_pkey";

alter table public.llm_model add constraint "public_llm_model_llm_provider_id_fkey" FOREIGN KEY (llm_provider_id) REFERENCES llm_provider(id) not valid;

alter table public.llm_model validate constraint "public_llm_model_llm_provider_id_fkey";

grant references on table public.llm_model to "authenticated";
grant select on table public.llm_model to "authenticated";
create policy "select_llm_model"
on public.llm_model
as permissive
for select
to authenticated
using (true);

