-- ============================================================================
-- IBLT · Diagnósticos de Propriedade Intelectual — esquema Supabase
-- Rode este script UMA vez no Supabase: Dashboard → SQL Editor → New query.
-- ============================================================================

-- 1) Tabela que recebe cada diagnóstico gerado pelos formulários ------------
create table if not exists public.diagnosticos (
  id              uuid primary key default gen_random_uuid(),
  created_at      timestamptz not null default now(),
  tipo            text,            -- ex.: "Patente", "Marca", "Programa de Computador"
  slug            text,            -- ex.: "PATENTE", "MARCA", "SOFTWARE"
  ativo           text,            -- título do ativo (titulo)
  prontidao       int,             -- score de prontidão (0–100)
  tier            text,            -- "Maduro" | "Em estruturação" | "Inicial" | "Crítico"
  frl             text,            -- faixa FRL
  contato_email   text,
  contato_tel     text,
  contato_org     text,
  eixos           jsonb,           -- [{eixo, score, status}, ...]
  proximos_passos jsonb,           -- ["passo 1", "passo 2", ...]
  dados           jsonb            -- payload completo do formulário (todas as respostas)
);

-- Índices úteis para o seu acompanhamento -----------------------------------
create index if not exists diagnosticos_created_at_idx on public.diagnosticos (created_at desc);
create index if not exists diagnosticos_slug_idx        on public.diagnosticos (slug);

-- 2) Segurança em nível de linha (RLS) --------------------------------------
-- O site é estático e usa a chave ANON pública. Por isso liberamos APENAS o
-- INSERT para visitantes anônimos. NINGUÉM consegue LER os dados pelo site —
-- você visualiza tudo pelo painel do Supabase (Table Editor), que usa a
-- service role e ignora o RLS.
alter table public.diagnosticos enable row level security;

drop policy if exists "anon pode inserir diagnostico" on public.diagnosticos;
create policy "anon pode inserir diagnostico"
  on public.diagnosticos
  for insert
  to anon, authenticated
  with check (true);

-- (Intencionalmente NÃO criamos policy de SELECT para anon: leitura fica
--  restrita ao painel/usuários autenticados que você definir.)

-- ============================================================================
-- Para consultar depois, no SQL Editor:
--   select created_at, tipo, ativo, prontidao, tier, contato_email
--   from public.diagnosticos
--   order by created_at desc;
-- ============================================================================
