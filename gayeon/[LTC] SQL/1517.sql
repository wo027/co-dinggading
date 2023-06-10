SELECT *
FROM
    Users
WHERE REGEXP_LIKE(mail, '^[A-Za-z]+[A-Za-z0-9\_\.\-]*@leetcode\\.com')

-- ^[A-Za-z] : 알파벳 대문자/소문자로 시작
-- + : 조건이 1회 이상 나타나는 문자
-- [A-Za-z0-9\_\.\-] : 알파벳 대문자/소문자, 숫자, 조건 부호
-- * : 0회 이상 나타나는 문자