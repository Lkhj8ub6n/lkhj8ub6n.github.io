-- ============================================================
-- إعداد جدول أسئلة صفحة بايثون على Supabase
-- ============================================================
-- جدول مستقل عن جدول العسكرية (questions) حتى لا تختلط الأسئلة.
-- شغّل هذا الملف في: Supabase Dashboard → SQL Editor → New query → Run
-- ثم استورد الأسئلة من ملف python/questions.csv (انظر التعليمات في نهاية الملف).
-- ============================================================

-- 1) إنشاء الجدول (نفس أعمدة ملف CSV بالضبط)
create table if not exists public.python_questions (
    id             integer primary key,
    section        text,
    subsection     text,
    question       text,
    option_a       text,
    option_b       text,
    option_c       text,
    option_d       text,
    correct_option text,   -- 'a' أو 'b' أو 'c' أو 'd'
    correct_text   text
);

-- 2) تفعيل Row Level Security + سياسة قراءة عامة (القراءة فقط) للمفتاح العام
alter table public.python_questions enable row level security;

drop policy if exists "python_questions public read" on public.python_questions;
create policy "python_questions public read"
    on public.python_questions
    for select
    to anon
    using (true);

-- 3) (اختياري) مفتاح فتح/إغلاق الصفحة في جدول app_config
--    إن لم يكن جدول app_config موجوداً بعد، أنشئه أولاً:
create table if not exists public.app_config (
    key     text primary key,
    enabled boolean not null default true
);
alter table public.app_config enable row level security;

drop policy if exists "app_config public read" on public.app_config;
create policy "app_config public read"
    on public.app_config
    for select
    to anon
    using (true);

-- سجّل مفتاح صفحة بايثون (enabled = true تعني الصفحة مفتوحة)
insert into public.app_config (key, enabled)
values ('python', true)
on conflict (key) do nothing;

-- ============================================================
-- استيراد الأسئلة من CSV
-- ============================================================
-- الطريقة الأسهل (بدون كود):
--   Supabase Dashboard → Table Editor → اختر جدول python_questions
--   → زر Insert → Import data from CSV → ارفع ملف python/questions.csv
--   (رؤوس الأعمدة في الملف مطابقة تماماً لأسماء الأعمدة هنا).
--
-- للتحديث لاحقاً: عدّل python/questions.csv ثم أعد الاستيراد،
-- أو امسح الصفوف القديمة أولاً:  delete from public.python_questions;
-- ============================================================
