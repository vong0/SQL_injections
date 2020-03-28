drop view if exists subject_summary;

create view subject_summary(code, uoc, offering) as
SELECT      s.code::text, s.uoc::text, string_agg(t.name, ',' order by t.name)
FROM        Subjects s 
JOIN        Courses c ON s.id = c.subject_id
JOIN        Terms t on t.id = c.term_id
GROUP BY    s.code, s.uoc
;