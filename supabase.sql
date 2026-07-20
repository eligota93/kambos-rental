create extension if not exists pgcrypto;
create table if not exists public.blocked_dates (
  id uuid primary key default gen_random_uuid(),
  vehicle_id text not null,
  start_date date not null,
  end_date date not null,
  note text default '',
  created_at timestamptz not null default now(),
  created_by uuid default auth.uid(),
  constraint valid_range check (end_date >= start_date)
);
create index if not exists blocked_dates_vehicle_range on public.blocked_dates(vehicle_id,start_date,end_date);
alter table public.blocked_dates drop constraint if exists season_limit;
alter table public.blocked_dates add constraint season_limit check (end_date <= date '2027-07-15');
alter table public.blocked_dates enable row level security;
drop policy if exists "Public can view availability" on public.blocked_dates;
drop policy if exists "Authenticated admins can insert" on public.blocked_dates;
drop policy if exists "Authenticated admins can update" on public.blocked_dates;
drop policy if exists "Authenticated admins can delete" on public.blocked_dates;
create policy "Public can view availability" on public.blocked_dates for select using (true);
create policy "Authenticated admins can insert" on public.blocked_dates for insert to authenticated with check (auth.uid() = created_by);
create policy "Authenticated admins can update" on public.blocked_dates for update to authenticated using (true) with check (true);
create policy "Authenticated admins can delete" on public.blocked_dates for delete to authenticated using (true);
