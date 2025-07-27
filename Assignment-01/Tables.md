# 📋 Tables Derived from ER Diagram

This document describes the relational schema derived from the ER diagram for the Movie Ticket Booking System.

---

## 1. User
| Field     | Data Type | Constraint     |
|-----------|-----------|----------------|
| user_id   | INT       | PRIMARY KEY    |
| name      | VARCHAR   | NOT NULL       |
| phone     | VARCHAR   | UNIQUE         |
| email     | VARCHAR   | UNIQUE         |

---

## 2. Theatre
| Field      | Data Type | Constraint     |
|------------|-----------|----------------|
| theatre_id | INT       | PRIMARY KEY    |
| name       | VARCHAR   | NOT NULL       |
| location   | VARCHAR   | NOT NULL       |

---

## 3. Movie
| Field     | Data Type | Constraint     |
|-----------|-----------|----------------|
| movie_id  | INT       | PRIMARY KEY    |
| title     | VARCHAR   | NOT NULL       |
| genre     | VARCHAR   |                |
| duration  | INT       | (minutes)      |
| rating    | FLOAT     |                |

---

## 4. Showtime
| Field       | Data Type | Constraint                    |
|-------------|-----------|-------------------------------|
| showtime_id | INT       | PRIMARY KEY                   |
| movie_id    | INT       | FOREIGN KEY → Movie(movie_id) |
| theatre_id  | INT       | FOREIGN KEY → Theatre(theatre_id) |
| date        | DATE      | NOT NULL                      |
| time        | TIME      | NOT NULL                      |

---

## 5. Booking
| Field        | Data Type | Constraint                          |
|--------------|-----------|-------------------------------------|
| booking_id   | INT       | PRIMARY KEY                         |
| user_id      | INT       | FOREIGN KEY → User(user_id)         |
| showtime_id  | INT       | FOREIGN KEY → Showtime(showtime_id) |
| seats        | INT       | NOT NULL                            |
| total_amount | FLOAT     |                                     |

