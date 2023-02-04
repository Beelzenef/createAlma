# BUx SBR101

sqlifying data from [Baseball Databank](https://github.com/chadwickbureau/baseballdatabank) while following [Sabermetrics 101: Introduction to Baseball Analytics](https://learning.edx.org/course/course-v1:BUx+SABR101x+2T2015/home) course

![Sabermetrics 101 course banner](https://courses.edx.org/assets/courseware/v1/c24eae97c30f336cfc89c008569d8cfd/asset-v1:BUx+SABR101x+2T2015+type@asset+block/Sabermetrics_Full_Size.png)

### Tables and database

From Baseball Databank:

```mermaid
erDiagram
    PLAYER ||--o{ MANAGER: "can be"
    PLAYER }|--|| COUNTRY: borns
    PLAYER }|--|{ PITCHING: makes
    PLAYER }|--|{ FIELDING: makes
    PLAYER }|--|{ BATTING: makes
    PLAYER }|--|{ APPEARANCES: has
    APPEARANCES }|--|{ TEAM: "in a "
    TEAM }|--|{ PARK : has
    PARK }|--|| COUNTRY : locates
    MANAGER }|--|{ TEAM : "works in"
    FRANCHISE ||--|{ TEAM: owns
    FRANCHISE }|--|| COUNTRY: locates
```