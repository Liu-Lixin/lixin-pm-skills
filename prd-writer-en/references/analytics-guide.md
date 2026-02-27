# Analytics Requirements Definition Guide

## Core Concept

Analytics events are the foundation for measuring product success metrics. By systematically defining analytics events, we can:
- Quantify user behavior
- Validate product hypotheses
- Identify optimization opportunities
- Support data-driven decisions

## Event Classification

### By Priority Level

| Priority | Definition | Example | Required |
|----------|-----------|---------|----------|
| P0 | Core business metrics, directly impacts success | Conversion rate, retention rate, revenue | ✅ Must |
| P1 | Optimization analysis, helps understand user behavior | Page views, feature usage frequency | 💡 Recommended |
| P2 | Auxiliary analysis, low priority | Hover, scroll, micro-interactions | 🔧 Optional |

### By Interaction Type

| Interaction Type | Trigger | Example |
|-----------------|---------|---------|
| Page View | User enters page | `homepage_viewed`, `product_detail_viewed` |
| Button Click | User clicks button | `checkout_button_clicked`, `share_button_clicked` |
| Form Submit | User submits form | `registration_form_submitted`, `search_form_submitted` |
| Content Interaction | User interacts with content | `video_played`, `article_liked`, `comment_posted` |
| State Change | System state changes | `order_status_changed`, `payment_completed` |
| Error Event | Error occurs | `payment_failed`, `network_error` |

## Standard Analytics Fields

### Universal Fields (All Events Include)

```
user_id: Unique user identifier
timestamp: Event timestamp (milliseconds)
event_name: Event name (English, snake_case)
platform: Platform (iOS/Android/Web)
app_version: App version number
session_id: Session ID (track user behavior in one session)
```

### Business Fields (Add Based on Event)

**Location Info**:
- `page_name`: Page name
- `section_name`: Section within page
- `position`: Element position in list

**Content Info**:
- `item_id`: Content/product ID
- `item_title`: Content/product title
- `item_type`: Content/product type
- `category`: Category

**Action Info**:
- `action_type`: Action type (click, submit, cancel)
- `target_url`: Target URL
- `button_name`: Button name

**Status Info**:
- `user_stage`: User stage (new/active/inactive)
- `user_status`: User status (logged in/logged out)
- `result`: Operation result (success/failure)
- `error_code`: Error code (if failed)

## Event Naming Convention

### Format

`{module}_{object}_{action}`

### Examples

**Page View Events**:
- `homepage_viewed` - Homepage viewed
- `product_list_viewed` - Product list viewed
- `checkout_page_viewed` - Checkout page viewed

**Button Click Events**:
- `add_to_cart_button_clicked` - Add to cart button clicked
- `checkout_button_clicked` - Checkout button clicked
- `share_button_clicked` - Share button clicked

**Form Submit Events**:
- `login_form_submitted` - Login form submitted
- `registration_form_submitted` - Registration form submitted
- `search_form_submitted` - Search form submitted

**Content Interaction Events**:
- `video_played` - Video played
- `article_liked` - Article liked
- `comment_posted` - Comment posted

**State Change Events**:
- `order_status_changed` - Order status changed
- `payment_completed` - Payment completed
- `user_logged_in` - User logged in

## Common Scenario Analytics Definitions

### Scenario 1: E-Commerce Purchase Flow

```
1. Homepage View
   - Event: homepage_viewed
   - Priority: P1
   - Fields: page_name, user_status

2. Product Search
   - Event: product_search_submitted
   - Priority: P0
   - Fields: search_keyword, result_count

3. Product Detail View
   - Event: product_detail_viewed
   - Priority: P1
   - Fields: product_id, product_category, price

4. Add to Cart
   - Event: add_to_cart_clicked
   - Priority: P0
   - Fields: product_id, quantity, price

5. Checkout Start
   - Event: checkout_started
   - Priority: P0
   - Fields: cart_value, item_count

6. Payment Complete
   - Event: payment_completed
   - Priority: P0
   - Fields: order_id, payment_amount, payment_method
```

### Scenario 2: Content Platform

```
1. Homepage View
   - Event: homepage_viewed
   - Priority: P1
   - Fields: page_name

2. Content List View
   - Event: content_list_viewed
   - Priority: P1
   - Fields: category, page_number

3. Content Detail View
   - Event: content_detail_viewed
   - Priority: P0
   - Fields: content_id, content_type, author_id

4. Content Like
   - Event: content_liked
   - Priority: P1
   - Fields: content_id, content_type

5. Comment Post
   - Event: comment_posted
   - Priority: P1
   - Fields: content_id, comment_length

6. Content Share
   - Event: content_shared
   - Priority: P1
   - Fields: content_id, share_channel
```

### Scenario 3: User Authentication

```
1. Login Page View
   - Event: login_page_viewed
   - Priority: P1
   - Fields: page_name

2. Login Form Submit
   - Event: login_form_submitted
   - Priority: P0
   - Fields: login_method (email/phone/social)

3. Login Success
   - Event: login_success
   - Priority: P0
   - Fields: login_method, user_stage

4. Login Failure
   - Event: login_failed
   - Priority: P0
   - Fields: login_method, error_code

5. Registration Page View
   - Event: registration_page_viewed
   - Priority: P1
   - Fields: page_name

6. Registration Form Submit
   - Event: registration_form_submitted
   - Priority: P0
   - Fields: registration_method

7. Registration Success
   - Event: registration_success
   - Priority: P0
   - Fields: registration_method
```

## Analytics Definition Template

For each user story, generate an analytics table:

| Interaction | Event Name | Priority | Universal Fields | Business Fields | Notes |
|-------------|-----------|----------|------------------|-----------------|-------|
| Page view | xxx_viewed | P0/P1/P2 | user_id, timestamp, event_name, platform | [specific fields] | [notes] |
| Button click | xxx_clicked | P0/P1/P2 | user_id, timestamp, event_name, platform | [specific fields] | [notes] |
| Form submit | xxx_submitted | P0/P1/P2 | user_id, timestamp, event_name, platform | [specific fields] | [notes] |

## Analytics Collection Checklist

After completing analytics collection, verify:

- [ ] All P0 events are defined
- [ ] Event names follow convention (snake_case)
- [ ] Each event includes universal fields
- [ ] Business fields are clear and implementable
- [ ] Event priorities are reasonable
- [ ] No duplicate event definitions
- [ ] Events support success metric measurement
- [ ] User understands and approves all events

## FAQ

**Q: Will too many analytics events impact performance?**
A: Analytics events have minimal performance impact. The key is choosing correct priorities - P0 events are essential, P1/P2 can be selected based on resources.

**Q: Can we customize analytics fields?**
A: Yes. Standard fields are recommendations. Adjust based on actual business needs while maintaining naming conventions and field clarity.

**Q: When should we start collecting analytics?**
A: Recommend collecting after completing all user story business logic discussion, before acceptance criteria. This ensures analytics align with business logic.

**Q: How do we verify analytics definition completeness?**
A: Check if analytics events can measure all success metrics. If a success metric can't be measured with current events, analytics definition is incomplete.
