concrete QuestionLat of Question = CatLat ** open ResLat, IrregLat, Prelude in {

--  flags optimize=all_subs ;
  --
  lin
--
--    QuestCl cl = {
--      s = \\t,a,p => 
--            let cls = cl.s ! t ! a ! p 
--            in table {
--              QDir   => cls ! OQuest ;
--              QIndir => "if" ++ cls ! ODir
--              } ---- "whether" in ExtLat
--      } ;
    --
    
--  QuestVP     : IP -> VP -> QCl ;      -- who walks
    QuestVP ip vp = 
      let qcl = mkQuestion { s = ip.s ! Nom } ( mkClause emptyNP vp )--(qp.s ! Nom) (agrP3 qp.n) vp
      in {s = \\t,a,b,qd => qcl.s ! t ! a ! b ! qd} ;
--
--    QuestSlash ip slash = 
--      mkQuestion (ss (slash.c2 ++ ip.s ! Acc)) slash ;
--      --- stranding in ExratLat 
--
    QuestIAdv iadv cl = mkQuestion iadv cl ;
--
    QuestIComp icomp np = 
      mkQuestion icomp (mkClause np (predV be_V)) ;
--
--
--    PrepIP p ip = {s = p.s ++ ip.s ! Acc} ;
--
--    AdvIP ip adv = {
--      s = \\c => ip.s ! c ++ adv.s ;
--      n = ip.n
--      } ;
-- 
--    IdetCN idet cn = {
--      s = \\c => idet.s ++ cn.s ! idet.n ! c ; 
--      n = idet.n
--      } ;
--
--    IdetIP idet = {
--      s = \\c => idet.s ; 
--      n = idet.n
--      } ;
--
--    IdetQuant idet num = {
--      s = idet.s ! num.n ++ num.s ; 
--      n = num.n
--      } ;
--
    CompIAdv a = a ;
--    CompIP p = ss (p.s ! Nom) ;
--
}
