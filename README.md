# Huwayda Line

واجهة متجر أولية ثابتة قابلة للنشر على Cloudflare Pages أو GitHub Pages.

## النشر
- اربط المستودع بمشروع Cloudflare Pages.
- Framework preset: None
- Build command: اتركه فارغاً
- Build output directory: /
- كل commit جديد على main سيؤدي إلى نشر تلقائي.

## تنبيه
هذه نسخة واجهة تجريبية فقط. إرسال الطلب يفتح واتساب برسالة جاهزة، ولا توجد قاعدة بيانات أو لوحة إدارة أو مصادقة أو مخزون مشترك. لا تجمع بيانات زبائن حساسة قبل إضافة backend آمن.


## Product admin setup (one administrator)

1. Create a free Supabase project.
2. In Supabase SQL Editor, run `supabase/schema.sql`.
3. In Authentication settings, disable public sign-ups.
4. Create the single administrator account manually in Supabase Authentication > Users.
5. Copy the Project URL and anon/public key into `config.js` (never use the service_role key).
6. After Cloudflare Pages deploys, open `/admin.html` and sign in with that account.

The admin page supports adding, editing, deleting, publishing/unpublishing products, and uploading product photos. Products are stored in Supabase and appear on the storefront without another GitHub edit.
