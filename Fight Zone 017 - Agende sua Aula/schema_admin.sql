create table if not exists public.turmas (
  id bigint generated always as identity primary key,
  data date not null,
  hora text not null
);

create table if not exists public.agendamentos (
  id bigint generated always as identity primary key,
  turma_id bigint references public.turmas(id) on delete cascade,
  nome text not null,
  email text not null,
  telefone text not null,
  created_at timestamptz default now()
);

alter table public.turmas enable row level security;
alter table public.agendamentos enable row level security;

create policy "read_all_turmas" on public.turmas for select using (true);
create policy "read_all_agendamentos" on public.agendamentos for select using (true);
create policy "insert_agendamentos" on public.agendamentos for insert with (true);
