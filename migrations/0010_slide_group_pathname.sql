-- 幻燈片分組新增前端頁面路徑 (pathname) 字段與索引
ALTER TABLE ay_slide_group ADD COLUMN pathname TEXT DEFAULT '';
CREATE INDEX IF NOT EXISTS idx_slide_group_pathname ON ay_slide_group (pathname);

-- 初始化現有首頁輪播路徑為根路徑
UPDATE ay_slide_group SET pathname = '/' WHERE gid = '1' AND (pathname IS NULL OR pathname = '');
