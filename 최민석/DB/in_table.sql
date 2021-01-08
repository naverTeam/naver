
SELECT *
FROM blog_post 
WHERE id='cjsgoddns' 
AND postCNum=1 
AND postNo=(SELECT MAX(postNo) 
				FROM blog_post);




SELECT MAX(postNo) FROM blog_post WHERE id='cjsgoddns' AND postCNum=1;

SELECT * FROM blog_post WHERE id='cjsgoddns' AND postCNum=1 AND postNo=212;