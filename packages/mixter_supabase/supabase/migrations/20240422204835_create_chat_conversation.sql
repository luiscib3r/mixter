create table public.chat_conversation (
    "id" uuid not null default gen_random_uuid(),
    "title" character varying,
    "initialized" boolean not null default false,
    "user_id" uuid not null default auth.uid(),
    "created_at" timestamp with time zone not null default now()
);

alter table public.chat_conversation enable row level security;

CREATE UNIQUE INDEX chat_conversation_pkey ON public.chat_conversation USING btree (id);

alter table public.chat_conversation add constraint "chat_conversation_pkey" PRIMARY KEY using index "chat_conversation_pkey";

grant insert on table public.chat_conversation to "authenticated";
create policy "create_chat_conversation"
on public.chat_conversation
as permissive
for insert
to authenticated
with check (true);

grant update on table public.chat_conversation to "authenticated";
create policy "update_chat_conversation"
on public.chat_conversation
as permissive
for update
to authenticated
using ( (select auth.uid()) = user_id );

grant references on table public.chat_conversation to "authenticated";
grant select on table public.chat_conversation to "authenticated";
create policy "select_chat_conversation"
on public.chat_conversation
as permissive
for select
to authenticated
using ( (select auth.uid()) = user_id );

grant delete on table public.chat_conversation to "authenticated";
create policy "delete_chat_conversation"
on public.chat_conversation
as permissive
for delete
to authenticated
using ( (select auth.uid()) = user_id );
