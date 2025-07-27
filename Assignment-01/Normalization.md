# 🧮 Normalization Steps for Movie Ticket Booking System

We apply normalization to remove redundancy and ensure data integrity.

---

## 🎯 1NF (First Normal Form)
✅ All attributes have atomic values.  
✅ No repeating groups.

> Example: `seats` in Booking is a single integer, not a list.

---

## 🎯 2NF (Second Normal Form)
✅ Already in 1NF  
✅ No partial dependency on a composite primary key.

> All non-key attributes in Booking depend on the whole primary key (`booking_id`), not just part of it.

---

## 🎯 3NF (Third Normal Form)
✅ Already in 2NF  
✅ No transitive dependency.

> For example, in User, `email` and `phone` depend only on `user_id`, and not on `name`.

---

### Final Result:
All 5 tables (User, Theatre, Movie, Showtime, Booking) are in **3NF**  
✔️ No redundancy  
✔️ High data integrity  
✔️ Efficient and optimal database design
