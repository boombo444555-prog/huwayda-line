-- Run this once in Supabase SQL Editor.
create table if not exists public.products (
  id uuid primary key default gen_random_uuid(),
  code text not null unique,
  name text not null,
  description text default '',
  category text not null default 'sport',
  price numeric(10,2) not null default 0,
  sizes text default '',
  colors text default '',
  image_url text default '',
  active boolean not null default true,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);
alter table public.products enable row level security;
drop policy if exists "Public can view active products" on public.products;
create policy "Public can view active products" on public.products for select using (active = true);
drop policy if exists "Admin can manage products" on public.products;
create policy "Admin can manage products" on public.products for all to authenticated using (true) with check (true);

insert into storage.buckets (id, name, public, file_size_limit, allowed_mime_types)
values ('product-images', 'product-images', true, 5242880, array['image/jpeg','image/png','image/webp'])
on conflict (id) do update set public = true;

drop policy if exists "Public can view product images" on storage.objects;
create policy "Public can view product images" on storage.objects for select using (bucket_id = 'product-images');
drop policy if exists "Admin can upload product images" on storage.objects;
create policy "Admin can upload product images" on storage.objects for insert to authenticated with check (bucket_id = 'product-images');
drop policy if exists "Admin can update product images" on storage.objects;
create policy "Admin can update product images" on storage.objects for update to authenticated using (bucket_id = 'product-images') with check (bucket_id = 'product-images');
drop policy if exists "Admin can delete product images" on storage.objects;
create policy "Admin can delete product images" on storage.objects for delete to authenticated using (bucket_id = 'product-images');
