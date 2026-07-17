# KamboS Rental Car

Responsive rental website with 19 individually bookable vehicles, date-based seasonal pricing, WhatsApp reservation messages and a Supabase-backed admin panel.

## Setup

1. Create a Supabase project.
2. Run `supabase.sql` in the Supabase SQL editor.
3. In Authentication, create the admin email/password user.
4. Add the project URL and public anon key to `config.js`. The anon key is designed for browser use; never add a service-role key.
5. Deploy this folder to Vercel, Netlify or GitHub Pages.

The public site can be previewed without Supabase, but secure date management becomes active only after configuration. The administrator manually blocks dates after confirming a WhatsApp request.

## Important

The current external car photos are representative internet images. Replace them with exact fleet photos before final publication when available. Review text is explicitly marked illustrative and should be replaced with verified customer feedback.
