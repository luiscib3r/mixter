create type "public"."user_role" as enum ('system', 'user', 'assistant');

create table "public"."chat_message" (
    "id" uuid not null default gen_random_uuid(),
    "content" text not null,
    "role" "user_role" not null default 'user'::"user_role",
    "chat_conversation_id" uuid not null,
    "user_id" uuid not null default auth.uid(),
    "created_at" timestamp with time zone not null default now()
);


alter table "public"."chat_message" enable row level security;

CREATE UNIQUE INDEX chat_message_pkey ON public.chat_message USING btree (id);

alter table "public"."chat_message" add constraint "chat_message_pkey" PRIMARY KEY using index "chat_message_pkey";

alter table "public"."chat_message" add constraint "public_chat_message_chat_conversation_id_fkey" FOREIGN KEY (chat_conversation_id) REFERENCES chat_conversation(id) ON UPDATE CASCADE ON DELETE CASCADE not valid;

alter table "public"."chat_message" validate constraint "public_chat_message_chat_conversation_id_fkey";

grant insert on table "public"."chat_message" to "authenticated";
create policy "create_chat_message"
on "public"."chat_message"
as permissive
for insert
to authenticated
with check (true);

grant update on table "public"."chat_message" to "authenticated";
create policy "update_chat_message"
on "public"."chat_message"
as permissive
for update
to authenticated
using ((auth.uid() = user_id));

grant references on table "public"."chat_message" to "authenticated";
grant select on table "public"."chat_message" to "authenticated";
create policy "select_chat_message"
on "public"."chat_message"
as permissive
for select
to authenticated
using ((auth.uid() = user_id));

grant delete on table "public"."chat_message" to "authenticated";
create policy "delete_chat_message"
on "public"."chat_message"
as permissive
for delete
to authenticated
using ((auth.uid() = user_id));


