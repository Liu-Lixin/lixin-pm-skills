# 埋点需求定义指南

## 核心概念

埋点（Analytics Event）是衡量产品成功指标的基础。通过系统性地定义埋点，我们可以：
- 量化用户行为
- 验证产品假设
- 识别优化机会
- 支持数据驱动决策

## 埋点分类

### 按优先级分类

| 优先级 | 定义 | 示例 | 是否必须 |
|-------|------|------|--------|
| P0 | 核心业务指标相关，直接影响成功指标 | 转化率、留存率、收入 | ✅ 必须 |
| P1 | 优化分析相关，帮助理解用户行为 | 页面浏览、功能使用频率 | 💡 建议 |
| P2 | 辅助分析，低优先级 | 悬停、滑动等微交互 | 🔧 可选 |

### 按交互类型分类

| 交互类型 | 触发时机 | 示例 |
|---------|--------|------|
| 页面浏览 | 用户进入页面 | `homepage_viewed`, `product_detail_viewed` |
| 按钮点击 | 用户点击按钮 | `checkout_button_clicked`, `share_button_clicked` |
| 表单提交 | 用户提交表单 | `registration_form_submitted`, `search_form_submitted` |
| 内容交互 | 用户与内容交互 | `video_played`, `article_liked`, `comment_posted` |
| 状态变化 | 系统状态改变 | `order_status_changed`, `payment_completed` |
| 错误事件 | 发生错误 | `payment_failed`, `network_error` |

## 标准埋点字段

### 通用字段（所有埋点都包含）

```
user_id: 用户唯一标识
timestamp: 事件发生时间戳（毫秒级）
event_name: 事件名称（英文，snake_case）
platform: 平台（iOS/Android/Web）
app_version: APP版本号
session_id: 会话ID（用于追踪用户在一次会话中的行为）
```

### 业务字段（根据具体事件添加）

**位置信息**:
- `page_name`: 页面名称
- `section_name`: 页面内的区域名称
- `position`: 元素在列表中的位置

**内容信息**:
- `item_id`: 内容/商品ID
- `item_title`: 内容/商品标题
- `item_type`: 内容/商品类型
- `category`: 分类

**操作信息**:
- `action_type`: 操作类型（如 click, submit, cancel）
- `target_url`: 目标URL
- `button_name`: 按钮名称

**状态信息**:
- `user_stage`: 用户阶段（新用户/活跃用户/流失用户）
- `user_status`: 用户状态（登录/未登录）
- `result`: 操作结果（success/failure）
- `error_code`: 错误代码（如果失败）

## 埋点命名规范

### 格式

`{模块}_{对象}_{动作}`

### 示例

**页面浏览类**:
- `homepage_viewed` - 首页被浏览
- `product_list_viewed` - 产品列表被浏览
- `checkout_page_viewed` - 结账页面被浏览

**按钮点击类**:
- `add_to_cart_button_clicked` - 加入购物车按钮被点击
- `checkout_button_clicked` - 结账按钮被点击
- `share_button_clicked` - 分享按钮被点击

**表单提交类**:
- `login_form_submitted` - 登录表单被提交
- `registration_form_submitted` - 注册表单被提交
- `search_form_submitted` - 搜索表单被提交

**内容交互类**:
- `video_played` - 视频被播放
- `article_liked` - 文章被点赞
- `comment_posted` - 评论被发布

**状态变化类**:
- `order_status_changed` - 订单状态改变
- `payment_completed` - 支付完成
- `user_logged_in` - 用户登录

## 常见场景的埋点定义

### 场景1: 电商购物流程

```
1. 首页浏览
   - 埋点名: homepage_viewed
   - 优先级: P1
   - 字段: page_name, user_status

2. 搜索商品
   - 埋点名: product_search_submitted
   - 优先级: P0
   - 字段: search_keyword, result_count

3. 查看商品详情
   - 埋点名: product_detail_viewed
   - 优先级: P1
   - 字段: product_id, product_category, price

4. 加入购物车
   - 埋点名: add_to_cart_clicked
   - 优先级: P0
   - 字段: product_id, quantity, price

5. 结账
   - 埋点名: checkout_started
   - 优先级: P0
   - 字段: cart_value, item_count

6. 支付完成
   - 埋点名: payment_completed
   - 优先级: P0
   - 字段: order_id, payment_amount, payment_method
```

### 场景2: 内容平台

```
1. 首页浏览
   - 埋点名: homepage_viewed
   - 优先级: P1
   - 字段: page_name

2. 内容列表浏览
   - 埋点名: content_list_viewed
   - 优先级: P1
   - 字段: category, page_number

3. 内容详情浏览
   - 埋点名: content_detail_viewed
   - 优先级: P0
   - 字段: content_id, content_type, author_id

4. 内容点赞
   - 埋点名: content_liked
   - 优先级: P1
   - 字段: content_id, content_type

5. 评论发布
   - 埋点名: comment_posted
   - 优先级: P1
   - 字段: content_id, comment_length

6. 内容分享
   - 埋点名: content_shared
   - 优先级: P1
   - 字段: content_id, share_channel
```

### 场景3: 用户认证

```
1. 登录页面浏览
   - 埋点名: login_page_viewed
   - 优先级: P1
   - 字段: page_name

2. 登录表单提交
   - 埋点名: login_form_submitted
   - 优先级: P0
   - 字段: login_method (email/phone/social)

3. 登录成功
   - 埋点名: login_success
   - 优先级: P0
   - 字段: login_method, user_stage

4. 登录失败
   - 埋点名: login_failed
   - 优先级: P0
   - 字段: login_method, error_code

5. 注册页面浏览
   - 埋点名: registration_page_viewed
   - 优先级: P1
   - 字段: page_name

6. 注册表单提交
   - 埋点名: registration_form_submitted
   - 优先级: P0
   - 字段: registration_method

7. 注册成功
   - 埋点名: registration_success
   - 优先级: P0
   - 字段: registration_method
```

## 埋点定义模板

为每个用户故事生成埋点表格：

| 交互事件 | 埋点名称 | 优先级 | 通用字段 | 业务字段 | 备注 |
|---------|--------|-------|--------|--------|------|
| 页面展示 | xxx_viewed | P0/P1/P2 | user_id, timestamp, event_name, platform | [具体字段] | [说明] |
| 按钮点击 | xxx_clicked | P0/P1/P2 | user_id, timestamp, event_name, platform | [具体字段] | [说明] |
| 表单提交 | xxx_submitted | P0/P1/P2 | user_id, timestamp, event_name, platform | [具体字段] | [说明] |

## 埋点收集检查清单

完成埋点收集后，检查以下项目：

- [ ] 所有P0埋点都已定义
- [ ] 埋点命名遵循规范（snake_case）
- [ ] 每个埋点都包含通用字段
- [ ] 业务字段清晰且可实现
- [ ] 埋点优先级合理
- [ ] 没有重复的埋点定义
- [ ] 埋点能够支持成功指标的衡量
- [ ] 用户理解并认可所有埋点定义

## 常见问题

**Q: 埋点太多会不会影响性能？**
A: 埋点本身的性能影响很小。关键是要选择正确的优先级，P0埋点必须，P1/P2可根据资源情况选择。

**Q: 埋点字段可以自定义吗？**
A: 可以。标准字段是建议，根据实际业务需求可以调整。但要保持命名规范和字段含义的清晰。

**Q: 埋点什么时候开始收集？**
A: 建议在完成所有用户故事的业务逻辑讨论后、进入验收标准前收集。这样可以确保埋点与业务逻辑一致。

**Q: 如何验证埋点定义的完整性？**
A: 检查埋点是否能够支持成功指标的衡量。如果某个成功指标无法通过现有埋点衡量，说明埋点定义不完整。
