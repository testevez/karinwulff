# Karin Wulff Realtor — Lead-Gen Site Plan

## Context

Karin Wulff is a Realtor® at Nexus Realty (Arden/Asheville, NC). Her current online presence is fragmented across third-party profiles (Nexus, Zillow, Homes.com, LinkedIn) and a Lovable-generated SPA prototype at [asheville-welcome-hub.lovable.app](https://asheville-welcome-hub.lovable.app/) branded "AVL Living Consulting." That prototype is useful for tone but is a client-rendered SPA with no IDX or SEO infrastructure — not viable for production.

We are building her **own** site at a personal-brand domain to drive (1) organic SEO, (2) lead volume, and (3) **lead quality**. Land/lot leads and sub-$400K leads aren't worth her time; the funnel must tilt toward $750K+ buyers and relocators (who skew higher-priced).

**Hosting constraint:** static HTML/CSS/JS deployed to AWS S3 to keep monthly costs near zero. No origin server, no SSR at request time.

**Locked decisions** (from Q&A):
- Brand: **Karin Wulff, Realtor** (personal brand, primary). Relocation/visit packages live as a featured service, not the headline.
- Listings: **Build-time MLS feed → static listing pages** (highest SEO upside).
- Leads: **Email only via 3rd-party form endpoint** (no CRM yet).
- Audience tilt: **Luxury-leaning, relocation-friendly** — same funnel, luxury-priced hero.

## Brand pillars — what every page must convey

These six attributes are the differentiators that convert higher-end buyers. They drive copy, imagery, IA ordering, and testimonial selection. Any section that conveys none of them is filler.

1. **Easy to work with.** Warm, accessible, not pushy. The voice from the prototype ("I'll tell you where to find the best guac") nails this — keep it.
2. **Relentless and thorough at finding the best values.** "I will not let you overpay." Surfaces undervalued and off-market opportunities. This is the anti-commodity-agent message.
3. **Logistically capable.** Moves, financing timelines, inspections, contingencies, contractor coordination. Concierge-level execution, especially for relocators.
4. **Deep local network of bankers, lenders, and real estate attorneys.** Means smoother closings and often better rates. List the relationship categories (not necessarily individual partner names).
5. **WNC neighborhood/city coach.** Helps buyers *choose* the right community before house-hunting — Asheville vs. Black Mountain vs. Hendersonville vs. Brevard, schools, commute, climate, vibe. This is where the relocation and luxury funnels converge and is a major SEO/content hook (see neighborhood pages).
6. **Proven track record.** Actual sold transactions. Some are visible on her Zillow/Homes.com profiles; we'll surface curated recent solds + summary stats (transactions closed, total volume, $1M+ deals) on the homepage and `/sold/` page.

**Application across the site:**

| Surface | How the pillars show up |
|---|---|
| Homepage hero | One-line value prop hits #2 + #5 ("Find — and *win* — the right Asheville home, in the right neighborhood for you"). Sub-hero adds #1 + #3 + #4 in a 3-up. |
| Homepage social-proof strip | Track-record stats (#6): e.g. "X closings · $Y volume · Z% over asking avoided." |
| Homepage testimonial block | Curate quotes that reinforce #1 (easy), #2 (saved me money), #3 (handled everything). |
| `/about/` | Karin's story → why she's relentless, how she built the WNC network, her relocation perspective (she was a relocator). |
| `/buy/` | Lead with #2 + #5 + #4. Sections: "Choosing your community," "Finding hidden value," "Lender & attorney network," "What I handle for you." |
| `/sell/` | #2 + #3 + #6. Sections: "Pricing strategy," "Marketing & staging coordination," "My recent sold record." |
| `/relocate/` | #5 first, then #3. Visit packages embed #1. The quiz is the primary CTA on this page. |
| `/where-should-you-live/` quiz | #1 + #5 incarnate — playful, neighborhood-matching, ends in a soft lead capture pre-filled with quiz answers. |
| Neighborhood pages | #5 in the descriptive copy — "What it's like to live here, who it's right for, what you can walk to." Karin's first-person take, not Wikipedia paste. Includes drive-times to downtown, hospital, BRP entry, nearest brewery + trailhead. |
| Listing pages | #2 framing — "I'll tell you what's *actually* worth this price" via tour-request CTA. |
| Footer / About sidebar | #6 stats and credentials. |
| Lead form | Pre-headline reinforces #1 + #5: "Tell me what you're looking for — I'll help you find the right neighborhood and the right house, at the right price." |

## Success criteria

- **SEO:** Rank top-3 for "Karin Wulff" + "Karin Wulff Asheville Realtor"; rank page 1 for at least 5 of: `[neighborhood] homes for sale`, `Asheville luxury homes`, `moving to Asheville`, `Biltmore Forest real estate`, `Asheville real estate agent`. Core Web Vitals all green (LCP <2.0s, INP <100ms, CLS <0.05).
- **Volume:** ≥ 20 qualified form leads/month by month 6.
- **Quality:** ≥ 40% of leads in the $750K+ budget tier or relocation-with-budget; <10% land-only inquiries (filtered out by form structure and content focus).

## Tech stack

| Concern | Choice | Why |
|---|---|---|
| Framework | **Astro 5.x** | Pure static output, zero-JS by default → best-in-class Core Web Vitals → SEO advantage. Markdown/MDX content collections fit "edit locally" workflow perfectly. |
| Styling | **Tailwind CSS** + a small custom token layer | Fast iteration, tiny CSS via JIT, great with Astro. |
| Content | Markdown/MDX in `src/content/` with Zod-schema collections | Git-as-CMS. Antonio edits locally, commits, site rebuilds. |
| Images | Astro's `<Image>` + Sharp; AVIF/WebP with fallbacks | Auto-resize/optimize at build, big LCP win. |
| Forms | **Web3Forms** (free tier viable) or **Formspree** ($10/mo) | Static-friendly POST endpoint → email. Honeypot + reCAPTCHA v3 for spam. |
| Analytics | **GA4** + **Google Search Console** + **Plausible** (optional) | GA4 + GSC are free and necessary for SEO measurement. Plausible is cleaner if Karin wants it. |
| Hosting | **S3 + CloudFront + ACM + Route 53** | Static hosting, HTTPS, edge cache, Brotli, HTTP/2-3. Total infra cost ~$2–6/mo. |
| CI/CD | **GitHub Actions** | Two workflows: (a) on push → build + deploy; (b) nightly cron → fetch MLS → rebuild + deploy. |
| MLS feed | **Canopy MLS** RESO Web API (Trestle by CoreLogic) | The MLS for WNC. Karin requests IDX feed access through her broker at Nexus. |

**Estimated monthly cost:** ~$15–25/mo (S3 + CloudFront + Route 53 + form service + domain amortized). MLS feed cost depends on Canopy/Nexus arrangement; most agent IDX feeds are included with brokerage membership.

## Site structure (URL inventory)

```
/                              Homepage — luxury hero, featured neighborhoods, recent listings, lead form
/about/                        Karin's story (NJ → Catskills → Asheville, Tony & Siena, 5 yrs local)
/contact/                      Full contact + lead form

# Service pillars
/buy/                          Buyer services — pre-qual form embedded
/sell/                         Seller services — home valuation request form
/relocate/                     Relocation hub (replaces the prototype's "Move to Asheville")
  /relocate/visit-packages/    Weekend & week-long visit experiences (from prototype)
  /relocate/moving-to-asheville/  Pillar guide

# Listings (MLS-fed, build-time generated)
/homes-for-sale/                       Master search index w/ client-side filter
/homes-for-sale/[city]/                Asheville, Hendersonville, Black Mountain, Weaverville, Arden, Fletcher
/homes-for-sale/[neighborhood]/        Filtered by neighborhood
/luxury-homes-asheville/               Pillar: $1M+ tier
/listing/[mls-id]-[slug]/              Individual listing detail page

# Programmatic area pages — Asheville core + WNC towns (~20-25 to start)
# Karin's coverage is regional, not just city limits. Each page = "What it's like to live here,
# who it's right for, market snapshot, active listings, drive-time to downtown AVL + nearest hospital + BRP access."
/neighborhoods/

# Asheville core
/neighborhoods/biltmore-forest/        $1M-$10M tier — top luxury target
/neighborhoods/biltmore-park/
/neighborhoods/the-cliffs-at-walnut-cove/
/neighborhoods/reynolds-mountain/
/neighborhoods/grove-park/
/neighborhoods/montford/
/neighborhoods/kenilworth/
/neighborhoods/north-asheville/        Beaverdam, Lakeview Park — biking/hiking access
/neighborhoods/west-asheville/         Arts, breweries, walkable
/neighborhoods/south-asheville/
/neighborhoods/river-arts-district/

# WNC towns Karin covers (outside Asheville city limits — equally important)
/neighborhoods/black-mountain/         "America's prettiest small town" — luxury & retirement
/neighborhoods/weaverville/            North of AVL, mountain views, growing fast
/neighborhoods/fairview/               East of AVL, large lots, Cane Creek Valley
/neighborhoods/arden/                  South corridor, Nexus's home base
/neighborhoods/fletcher/
/neighborhoods/mills-river/            Western reaches — French Broad, growing luxury
/neighborhoods/candler/
/neighborhoods/leicester/              West/rural — for the "land + a few acres" buyer
/neighborhoods/swannanoa/              East of AVL, Warren Wilson, BRP-adjacent
/neighborhoods/hendersonville/         Apple country, retiree-friendly, downtown charm
/neighborhoods/flat-rock/              Hendersonville-area luxury, Carl Sandburg's town
/neighborhoods/brevard/                Pisgah Forest, waterfalls, music festival
/neighborhoods/lake-lure/              Resort/second-home market — Chimney Rock views
... etc.

# Lifestyle / interactive
/where-should-you-live/                 Gamified WNC neighborhood-match quiz (see below)
/where-should-you-live/result/[slug]/   Shareable, indexable result pages
/buyer-readiness/                       "Are you ready to buy?" calculator (see below)
/buyer-readiness/result/[band]/         Score bands: list-ready, almost-there, foundation-phase
/seller-readiness/                      "Is your house ready to sell?" calculator (see below)
/seller-readiness/result/[band]/        Score bands: list-ready, prep-needed, strategic-phase

# Content hub
/guides/                                Index
/guides/asheville-schools/              Public, charter, magnet
/guides/asheville-private-schools/      Montessori, Carolina Day, Asheville Christian, Hanger Hall
/guides/cost-of-living-asheville/
/guides/asheville-property-taxes/
/guides/buying-a-second-home-asheville/
/guides/luxury-home-features-mountain-homes/
/guides/asheville-vs-greenville-vs-charlotte/
/guides/blue-ridge-parkway-living/      Living near the BRP — best access points, what it's like
/guides/biking-in-asheville/            North AVL routes, Bent Creek, mountain biking, road biking
/guides/hiking-near-asheville/          Trail-adjacent neighborhoods, DuPont, Pisgah, MST
/guides/paddleboarding-and-water/       French Broad, Lake Lure, Lake Julian
/guides/asheville-breweries-by-neighborhood/  SEO-rich + voice
/guides/downtown-asheville-events/      Orange Peel, Grey Eagle, Downtown After 5, LEAF, Bele Chere legacy
/guides/asheville-cocktail-bars/        Sovereign Remedies, The Crow & Quill, Antidote, etc.

# Blog (cadence: 2-4/mo) — sample evergreen + seasonal topics
/blog/
/blog/best-public-schools-buncombe-county/
/blog/montessori-schools-asheville-guide/
/blog/downtown-after-5-2026/             Annually refreshed
/blog/orange-peel-vs-grey-eagle/         Venue guide — playful, voice-forward
/blog/best-cocktail-bars-asheville/
/blog/north-asheville-biking-guide/
/blog/where-locals-actually-paddle/
/blog/why-weaverville-is-having-a-moment/
/blog/black-mountain-vs-asheville-which-is-right-for-you/
/blog/living-near-blue-ridge-parkway-pros-cons/
/blog/asheville-fall-color-neighborhoods/   Seasonal traffic spike

# Social proof / market authority
/market-reports/                       Quarterly Asheville/WNC reports
/sold/                                 Recent transactions (when permitted)
/reviews/                              Aggregated client testimonials

# Tech
/sitemap.xml, /robots.txt, /rss.xml
/404
```

## SEO strategy

**On-page:**
- Per-page `<title>`, meta description, canonical, OG/Twitter cards via a shared `<SEO>` Astro component.
- JSON-LD: `RealEstateAgent` (Karin) on every page header; `LocalBusiness` for the brokerage; `Person` on /about; `Place` on neighborhood pages; `Residence`/`Product` on listings; `BreadcrumbList` site-wide; `FAQPage` on guides where applicable.
- Strict heading hierarchy (one H1, semantic H2/H3).
- Image alt text discipline — no decorative `alt=""` on content images.

**Site-architecture:**
- Hub-and-spoke internal linking. `/luxury-homes-asheville/` (pillar) ↔ each $1M+ neighborhood page ↔ active listings in that neighborhood ↔ relevant guides. Aim for 3–5 contextual internal links per content page.
- Breadcrumbs on every page.
- One sitemap, partitioned by section if it grows.

**Performance (SEO ranking factor):**
- Static HTML, zero JS by default, hydrate only what needs it (search filters, form validation).
- Inline critical CSS, defer non-critical.
- Preload hero image, lazy-load below the fold.
- Self-host fonts (woff2, `font-display: swap`).
- Brotli at CloudFront, HTTP/3 enabled.

**Local SEO (parallel work, not in-repo):**
- Google Business Profile — complete, verify, post weekly.
- NAP (Name, Address, Phone) consistent across all pages and citations.
- Citations: Nexus website, Zillow, Homes.com, Realtor.com, Yelp, BBB, NAR find-a-realtor — link back to the new site.

## Lead capture & quality filtering

The form is the quality gate. Same form everywhere, but field structure pre-segments leads:

| Field | Why |
|---|---|
| Name, email, phone (required) | Standard. Phone format validation. |
| **Budget** (radio) — Under $500K / $500–750K / $750K–1M / $1M–2M / $2M+ / Just looking | Primary quality signal. The email subject line and routing logic key off this. |
| **Timeline** — < 3 mo / 3–6 mo / 6–12 mo / > 12 mo / Exploring | Secondary quality signal. |
| **What you're looking for** — Buy / Sell / Relocate / Visit package / Other | Routes content of follow-up. |
| **Property type interest** — Single-family / Condo/Townhome / **Estate / Mountain home** / Land/Lot / Investment | "Land/Lot" leads route to a separate digest, not Karin's phone. |
| Message (optional) | Open-ended. |
| Honeypot field | Spam. |

**Routing (handled in Web3Forms/Formspree custom subject + cc rules, or via a tiny CloudFront Function if we want server logic):**
- $750K+ AND timeline ≤ 6 mo → email subject prefixed `[HOT]`, sent to Karin's primary inbox immediately.
- Buyer-readiness or Seller-readiness score 90+ → `[HOT]` regardless of budget tier (high readiness is itself a quality signal).
- Land/Lot only → email subject `[LAND]`, sent to a digest folder Karin reviews weekly.
- Everything else → standard `[LEAD]` to her inbox.

Lead body always includes: form source surface, calculator score band (if applicable), all answers, UTM params, landing page, referrer.

**Surfaces:**
1. Hero CTA — "Book a free Asheville home consultation."
2. Sticky bottom bar on mobile.
3. End-of-content forms on every guide and neighborhood page.
4. `/contact/` full form.
5. Listing-detail page: "Request a private tour of [address]" (auto-fills the listing reference).
6. Exit-intent modal (desktop only, throttled to once per 7 days per visitor).

**UTM/source tracking:** capture `utm_*` params + landing page + referrer in a hidden field so Karin sees what's converting.

## MLS / IDX integration (build-time)

**Goal:** Listings render as fully static HTML — same SEO power as a content page.

**Pipeline (nightly GitHub Actions cron):**
1. Authenticate to Canopy MLS RESO Web API (Trestle credentials stored in GitHub Actions secrets).
2. Fetch all active listings in target service area (Buncombe + Henderson + parts of Madison/Haywood).
3. **Filter for lead quality:**
   - Exclude: `PropertyType = Land` and `PropertySubType = Lot` and acreage-only listings.
   - Exclude: list price < $400K (configurable; this is a knob to tune).
   - Include: SFR, condo, townhome, multi-family, farm-with-residence.
4. Download listing photos to `public/listings/[mls-id]/` (resized via Sharp at build).
5. Write each listing as a JSON entry to `src/content/listings/`.
6. Build Astro → all listings now exist as static `/listing/[mls-id]-[slug]/` pages.
7. `aws s3 sync` to bucket; `aws cloudfront create-invalidation` for changed paths.

**Compliance:** Canopy MLS IDX rules require attribution, broker info, accurate fields, refresh frequency, and no scraping. Read the Canopy IDX policy carefully and add the required disclaimers to listing pages and footer.

**Featured listings logic on homepage:** sort the filtered set by price desc, take top N (e.g., 6), prefer "new this week" if available.

## AWS infrastructure

```
Route 53  (karinwulff.com)
   │
   ▼
CloudFront (HTTPS via ACM, Brotli, HTTP/3, custom error pages, redirect-to-trailing-slash)
   │
   ▼
S3 bucket (private, accessed via OAC) — static site assets
```

- Bucket policy: deny public; only CloudFront OAC can read.
- ACM cert in `us-east-1` (CloudFront requirement) for `karinwulff.com` + `www.karinwulff.com`.
- CloudFront cache policy: long TTL on `/_astro/*`, `/listings/*` images, fonts; short TTL on HTML.
- Security headers via CloudFront response-headers policy: HSTS, CSP (allow GA4 + form endpoint), X-Content-Type-Options, Referrer-Policy.
- Provision via Terraform or AWS CDK in `infra/` (Terraform recommended — simpler for this scope).

## "Where Should You Live in WNC?" — gamified neighborhood quiz

This is a tentpole feature: a playful, fully client-side quiz that recommends 2–3 WNC areas based on lifestyle answers. It does triple duty — top-of-funnel SEO hook, social-share magnet (Asheville culture loves quirky internet things), and a high-quality lead capture surface.

**Mechanics (pure JS, runs on the static page — no backend):**
- 8–10 questions, multiple choice, swipe-card UX. Each answer scores against a matrix of neighborhood archetypes.
- Question themes:
  - **Vibe:** "Weird and arty" (RAD, West AVL) vs. "Refined and quiet" (Biltmore Forest, Grove Park) vs. "Small-town porches" (Black Mountain, Weaverville) vs. "Off-grid mountain" (Fairview, Leicester).
  - **Walk to a brewery:** essential / nice-to-have / I'll drive / I make my own kombucha.
  - **Outdoor priority:** mountain biking trailhead (Bent Creek, North AVL), hiking (DuPont/Pisgah), paddleboarding (French Broad / Lake Lure), Blue Ridge Parkway access, golf (Walnut Cove / Biltmore Forest CC), or "wraparound porch with a view is enough."
  - **Downtown frequency:** every weekend (Montford, Kenilworth, RAD-adjacent) / monthly date night (South AVL) / a few times a year (Black Mountain, Brevard, Lake Lure).
  - **School needs:** public (Buncombe vs. Asheville City vs. Henderson), private/Montessori, none.
  - **Budget tier** — same as the lead form, double-purposes as the quality gate.
  - **Timeline + intent.**
  - **Optional:** "What's your spirit Asheville thing?" — kombucha / bluegrass jam / hot yoga / Friday at Highland / second-line at the Grey Eagle / drum circle at Pritchard Park. Pure tone-setter, light scoring.
- Each result is a **shareable, indexable** page at `/where-should-you-live/result/[slug]/` (e.g. `/result/north-asheville-bike-loving-foodie/`). Pre-generated combinations of top archetypes → static HTML, great for SEO and shareability.
- Result page shows: 2 primary recommendations + 1 "wildcard" pick, each linking to its neighborhood page, with a personalized "why" paragraph and a tour-request CTA pre-filled with the recommendations.
- **Lead capture:** result is shown immediately (no email-wall — that kills shares). Below the result, a *soft* form: "Want Karin to put together a list of actual homes in [recommended areas]? Drop your email and budget." Pre-fills the budget tier from the quiz answers.
- **Voice:** lean into the weird. Loading state line: "Consulting the bluegrass oracle…" Question copy: "Pick your Saturday: trail by 8am / brunch at 11 / both, somehow." This is a place where the brand voice gets to breathe.

**Tech notes:**
- Astro page with a small client-island (~10–15kb of JS, code-split). State in URL params so back-button and shares work.
- All scoring logic in a single TS module; quiz config in JSON for easy tuning.
- No analytics on individual answers (privacy + simplicity); just track quiz starts, completions, and result→lead-form conversions in GA4.

## Buyer Readiness & Seller Readiness calculators

Two short interactive tools modeled on the same tech foundation as the WNC quiz (pure client-side, static, no backend). Both serve as **lead-quality multipliers**: people who finish them have already pre-qualified themselves on the dimensions Karin cares about, and the score band tells her exactly how to follow up. Both also rank for high-intent search queries ("am I ready to buy a house," "how to prepare my house to sell").

### `/buyer-readiness/` — "Are you ready to buy?"

**Questions (~8, weighted scoring):**

| Question | Weight | Why it matters |
|---|---|---|
| Lender status: none / verbal pre-qual / written pre-approval / cash buyer | **High** | The single biggest signal — sellers don't take unverified buyers seriously, and neither does Karin. |
| Down-payment funds in hand (% of target price): <5 / 5–10 / 10–20 / 20+ / cash | **High** | Real money, ready to deploy. |
| Have you checked your credit in the last 6 months? Any known issues? | Medium | Surfaces problems before they kill a deal. |
| Current housing: renting / own + already sold / own + listed / own + not yet listed | Medium | Chain risk — own-not-listed = far from ready. |
| Timeline urgency: job already relocating / lease ending soon / flexible / exploring | Medium | Pairs with budget for the "[HOT]" lead-routing decision. |
| Budget tier (same options as the lead form) | Medium | Quality gate, also pre-fills the lead form. |
| Have you spoken with a lender? If yes — which one? | Low (data) | Signals seriousness; surfaces partners Karin already knows. |
| Are you familiar with closing costs and reserves? | Low | Gentle education check; opens door for Karin's lender network. |

**Score bands & result-page tone:**

- **90+ "List-ready buyer."** "You're ready to make offers." Result page shows current active listings in their budget + a one-click "Have Karin send a curated list this week" CTA.
- **60–89 "Almost there."** "Two or three small gaps to close." Personalized punch-list (e.g., "Get a written pre-approval — I can introduce you to two lenders I trust"). Soft CTA: book a 20-min call.
- **0–59 "Foundation phase."** "You're earlier in the journey — let's chart it." Educational primer (down-payment math, credit health, timing). CTA: "Get on Karin's monthly market intel email," low-pressure, long-nurture.

**Brand-pillar tie-ins:** explicit references to #4 (lender/attorney network) on the gap-closing recommendations, and #3 (logistics) on the closing-process explainer.

### `/seller-readiness/` — "Is your house ready to sell?"

**Questions (~8, weighted scoring):**

| Question | Weight | Why it matters |
|---|---|---|
| Reason for selling: relocation / downsize / upsize / estate / divorce / investment exit | Medium | Drives urgency framing; some categories are time-sensitive (relocation, estate). |
| Timeline: < 1 mo / 1–3 mo / 3–6 mo / 6–12 mo / exploring | **High** | Direct urgency signal. |
| Have you had a recent market valuation? When? By whom? | Medium | If no, that's job #1 — Karin offers a free CMA. |
| Mortgage situation: paid off / significant equity / break-even / underwater | Medium | Affects pricing strategy and net-proceeds expectations. |
| Are you replacing this home? Have you found the next one? | Medium | Chain risk; Karin's logistics shine here. |
| Prep status (multi-select checklist): deferred maintenance addressed / decluttered / professional photos / staged / pre-inspection done / paperwork organized | **High** | Each unchecked item is a Karin-managed deliverable (#3 logistics, #4 network of photographers/stagers/inspectors). |
| Pricing posture: aggressive for speed / market price / aspirational | Low | Signals strategy; opens the pricing conversation. |
| Listing platform expectations: just MLS / MLS + heavy marketing / off-market first | Low | Surfaces alignment with Karin's marketing approach. |

**Score bands & result-page tone:**

- **90+ "List-ready in 1–2 weeks."** "Your house could be on the market this month." CTA: "Schedule the photographer — Karin's photographer + stager are her people; we can move fast."
- **60–89 "Prep needed: 4–8 weeks."** Customized checklist of unchecked prep items, with Karin's vendor network ready to plug into each gap.
- **0–59 "Strategic phase."** "Start with a valuation, then we'll build a phased plan." CTA: free CMA request.

**Brand-pillar tie-ins:** every gap-closing recommendation routes through pillar #3 (logistics) and #4 (network). The seller calculator is one of the strongest places on the site to demonstrate that Karin doesn't just list houses — she runs the whole prep operation.

### Shared mechanics for both calculators

- Same tech as the WNC quiz: small Astro client-island, scoring in a single TS module, config in JSON, state in URL params for share/back-button support.
- Score bands have **pre-generated static result pages** at `/buyer-readiness/result/list-ready/` etc. — fully indexable, sharable, and the answers are encoded in URL params so the result is personalized but the underlying page is static HTML.
- Result page lead form is **pre-filled** from the calculator answers (budget, timeline, intent) so the lead form feels like a natural continuation, not a second ask. Submission tags the lead with the score band.
- **Lead routing impact:** any lead from the 90+ band of either calculator gets the `[HOT]` subject prefix regardless of budget, because high-readiness signal is itself a quality filter.
- **Optional PDF take-away:** "Email me my personalized next-steps PDF" generates a templated MDX → HTML → PDF (via build-time pre-rendering of all common bands, served as a static asset). This is a low-friction email capture for the 0–89 bands who aren't ready to book a call.

### Tools navigation grouping

The three interactive tools (`/where-should-you-live/`, `/buyer-readiness/`, `/seller-readiness/`) get a shared `/tools/` index page in the main nav for discoverability, while keeping their top-level URLs for SEO. The index cross-promotes them — a buyer who finishes the readiness check gets a "Now find your neighborhood →" CTA, and so on.

## Content strategy

**Tier 1 (launch must-have):**
- Homepage, About (Karin's story), Buy, Sell, Contact, Relocate hub.
- 10 cornerstone area pages spanning luxury + WNC coverage: Biltmore Forest, Biltmore Park, Walnut Cove, Grove Park, Montford, Kenilworth, North Asheville, **Black Mountain**, **Weaverville**, **Hendersonville**.
- 5 cornerstone guides: Moving to Asheville, Asheville Public Schools, Asheville Private Schools (Montessori focus), Cost of Living, Blue Ridge Parkway Living.
- "Where Should You Live in WNC?" quiz live at launch (it's a launch hook for social).

**Tier 2 (weeks 3–6):**
- Remaining 10–15 area pages (Fairview, Arden, Fletcher, Mills River, Candler, Leicester, Swannanoa, Flat Rock, Brevard, Lake Lure, RAD, West AVL, South AVL).
- Lifestyle guides: Biking in Asheville, Hiking near Asheville, Paddleboarding, Breweries by Neighborhood, Downtown Events, Cocktail Bars.
- Visit Packages page (port from prototype).
- First quarterly Market Report.

**Tier 3 (ongoing):**
- 2–4 blog posts/month — alternate between SEO-utility (school deep-dives, school-district maps, market trends) and voice-forward lifestyle (`Orange Peel vs. Grey Eagle`, `Where locals actually paddle`, seasonal Downtown After 5 recap).
- Quarterly market reports — separate sub-reports for Asheville core, Black Mountain/Weaverville corridor, and Hendersonville/Brevard.
- Listings auto-refresh nightly.

**Voice:** warm, specific, locally-informed, and *unafraid of Asheville's weirdness*. The town's identity is art, beer, bluegrass, drum circles at Pritchard Park, food co-ops, and people who moved here for the mountains and stayed for the community. Lean into it — sterile real estate copy will lose to a competitor who sounds like a neighbor. Karin's voice from the prototype works (`"I'll tell you where to find the best guac"`). Keep first-person Karin throughout — never "we." Reference real venues by name (Orange Peel, Grey Eagle, Sovereign Remedies, Highland Brewing, Wedge at Foundation, the LEAF Festival, Downtown After 5, Bele Chere's ghost). Reference real outdoor places (Bent Creek, DuPont, Pisgah, Mountains-to-Sea Trail, the French Broad, Looking Glass Falls). Anchor the About page in Karin's real story (NJ roots, Rutgers, NY/Catskills real estate, 5 years in Asheville with Tony and Siena).

**What we still need from Karin:**
- Headshots (high-res, multiple).
- Recorded answers to interview questions for the About page and FAQ.
- Permission to publish recent solds and any client testimonials.
- Canopy MLS IDX feed credentials (request from Nexus broker).
- Domain selection — confirm `karinwulff.com` availability/preference.

## Phasing & milestones

| Phase | Scope | Timeline |
|---|---|---|
| **0. Foundation** | Confirm domain; register; Astro repo scaffold; Tailwind + design tokens; layout components; SEO component; CI/CD; AWS infra (S3 + CloudFront + ACM + Route 53); deploy "Hello world" | Week 1 |
| **1. Core pages** | Homepage, About, Buy, Sell, Contact, Relocate hub; lead form (all surfaces); Web3Forms wired; analytics installed | Weeks 2–3 |
| **2. Neighborhoods + guides + tools** | 10 cornerstone area pages (incl. Black Mountain, Weaverville, Hendersonville); 5 cornerstone guides; all three interactive tools (Where Should You Live, Buyer Readiness, Seller Readiness) with shareable static result pages; `/tools/` index; internal linking finalized | Weeks 4–5 |
| **3. MLS integration** | Trestle API connector; nightly cron; listing index; listing detail template; featured listings on homepage | Weeks 6–7 |
| **4. Polish & launch** | Schema audit; Lighthouse pass; GSC submission; Google Business Profile sync; redirects from Nexus profile/Zillow profile pointing here | Week 8 |
| **5. Content engine** | Editorial cadence: market reports, blog posts, neighborhood expansion, sold listings | Ongoing |

## Critical files (to be created)

- `astro.config.mjs` — site URL, integrations (sitemap, mdx, tailwind), image config.
- `src/content.config.ts` — Zod schemas for `listings`, `neighborhoods`, `guides`, `posts`, `testimonials`.
- `src/components/SEO.astro` — title/meta/OG/canonical/JSON-LD, single source of truth.
- `src/components/LeadForm.astro` — the qualification form, with variants (`hero`, `inline`, `tour-request`).
- `src/components/Schema/RealEstateAgent.astro`, `Residence.astro`, `Place.astro`, `BreadcrumbList.astro`.
- `src/layouts/Base.astro` — header, footer, schema, fonts, analytics.
- `src/pages/index.astro`, `about.astro`, `buy.astro`, `sell.astro`, `contact.astro`, `relocate/index.astro`.
- `src/pages/neighborhoods/[slug].astro`, `src/pages/listing/[id].astro`, `src/pages/homes-for-sale/[location].astro`.
- `scripts/fetch-mls.ts` — RESO Web API client → writes content collection JSON.
- `.github/workflows/deploy.yml` — on-push build + deploy.
- `.github/workflows/refresh-listings.yml` — nightly cron: fetch MLS → build → deploy → invalidate.
- `infra/main.tf` (or `infra/cdk/`) — Terraform for S3, CloudFront, ACM, Route 53.

## Verification

- **Local dev:** `npm run dev` → site renders at localhost:4321; all pages reachable; forms validate; Lighthouse mobile ≥ 95 on every category.
- **Build:** `npm run build` produces a `dist/` of pure static HTML/CSS/JS; no runtime JS on content pages except the lead form and listing search.
- **MLS pipeline (after credentials available):** `npm run fetch-mls` populates `src/content/listings/`; build produces one HTML file per listing; spot-check 3 listings against MLS source for accuracy.
- **SEO sanity:** Each generated page has unique title/description/canonical/JSON-LD; sitemap covers every URL; `robots.txt` allows all; no orphan pages.
- **Forms end-to-end:** Submit each form variant from prod URL → confirm Karin receives email with correct subject prefix per budget tier; honeypot blocks bot submissions.
- **Performance budget:** Real-device mobile 4G test in PageSpeed Insights — LCP <2.0s on homepage, neighborhood page, listing page.
- **GSC:** Property verified, sitemap submitted, no coverage errors after first crawl.

## Open items requiring user input before/during build

1. Confirm domain (default plan assumes `karinwulff.com`).
2. Karin requests Canopy MLS IDX feed credentials via Nexus broker — start this now; it can take 1–4 weeks.
3. Karin sends headshots + a 30-min recorded interview for the About page.
4. AWS account access for Antonio (assumed available; confirm region preference — `us-east-1` recommended for CloudFront/ACM simplicity).
5. Decide on Web3Forms vs Formspree (Web3Forms free tier may be sufficient initially).
