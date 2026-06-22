/* ============================================================================
   IBLT — CONFIGURAÇÃO ÚNICA DOS DIAGNÓSTICOS
   ----------------------------------------------------------------------------
   Edite este arquivo UMA vez. Todos os formulários de diagnóstico
   (software, patente, desenho industrial, marca, base de dados, cultivar)
   leem estes valores. Basta manter o arquivo na MESMA pasta dos .html.
   ============================================================================ */
window.IBLT_CONFIG = {

  /* --- Contato --- */
  email:    "contato@iblt.org.br",   // destino do botão "Enviar por e-mail"
  whatsapp: "5531999999999",         // << TROQUE pelo número real (internacional, sem +, sem espaços)

  /* --- Supabase (onde os diagnósticos ficam guardados) --- */
  supabase: {
    // 1) Crie um projeto em https://supabase.com
    // 2) Em Project Settings → API, copie a URL e a chave "anon public"
    // 3) Rode o supabase-schema.sql no SQL Editor para criar a tabela
    url:     "https://SEU-PROJETO.supabase.co",   // << cole a Project URL
    anonKey: "SUA_ANON_KEY",                       // << cole a chave anon public
    table:   "diagnosticos"                        // nome da tabela (não precisa mudar)
  },

  /* --- Opcional: receber cada diagnóstico também por e-mail (Formspree) ---
     Deixe "" se for usar só o Supabase. Se preencher, funciona em paralelo. */
  endpoint: ""   // ex.: "https://formspree.io/f/xxxxxxx"
};
