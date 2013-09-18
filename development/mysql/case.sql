SELECT 
  `um`.`title` AS `umTitle`,
  CASE
    WHEN `um`.`campaign_id` IS NULL 
      THEN 'KEINE CAMPAGNE' 
    ELSE 
      CASE
        WHEN (SELECT `c`.`uid` FROM `campaign` AS `c` WHERE `c`.`id` = `um`.`campaign_id`) = '0e0ea0f7328d9632778ce9c31ee51a82'
          THEN 'Profilversand-1'
        ELSE 
          `um`.`number`
      END
  END  AS `Profil_ID` 
FROM 
  `user_memberships` AS `um`;
