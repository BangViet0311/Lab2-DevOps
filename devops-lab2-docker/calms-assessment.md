# CALMS Self-Assessment - Bàng Quốc Việt DTC235180196

## Đánh giá DevOps Maturity (1-5)

| Nguyên tắc | 1 (Yếu) | 3 (Trung bình) | 5 (Xuất sắc) | **Điểm** |
|-----------|---------|---------------|-------------|:-------:|
| **Culture** | Dev vs Ops đổ lỗi | Dev/Ops ngồi chung team | Cùng chịu trách nhiệm production | **3** |
| **Automation** | Deploy thủ công 100% | CI/CD cho 1 số project | Toàn bộ pipeline tự động | **3** |
| **Lean** | Setup > 1 ngày | Có script, Docker 1 phần | 1 lệnh → môi trường sẵn sàng | **4** |
| **Measurement** | Không biết app chạy | Có monitoring cơ bản | Dashboard real-time + alert | **2** |
| **Sharing** | Mỗi người tự biết | Có wiki nội bộ | Code review + post-mortem | **3** |
| **TỔNG** | | | | **15/25** |

## 3 Hành động cải thiện

1. **Thiết lập CI/CD pipeline hoàn chỉnh** cho project cá nhân bằng GitHub Actions (build, test, deploy tự động)
2. **Áp dụng Infrastructure as Code** với Terraform để provision AWS/Azure thay vì cấu hình thủ công qua console
3. **Thiết lập monitoring & alerting** cơ bản (Prometheus + Grafana) cho ứng dụng container hóa
