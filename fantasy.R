# TODO: Use MPG instead of Total Minutes

library(dataframes2xls)
players <- read.csv('2014_per_game.csv')
players <- players[players$MP > 20,c("Player", "Pos", "Tm", "FG", "FGA", "FG.", "X3P", "FT", "FTA", "FT.", "TRB", "AST", "STL", "BLK", "TOV", "PTS")]
players$FGS <- players$FGA / max(players$FGA) * (players$FG. - median(players$FG.))/(quantile(players$FG., 0.75) - quantile(players$FG., 0.25))
players$FTS <- players$FTA / max(players$FTA) * (players$FT. - median(players$FT.))/(quantile(players$FT., 0.75) - quantile(players$FT., 0.25))
players$FG_SD <- (players$FGS - median(players$FGS))/(quantile(players$FGS, 0.75) - quantile(players$FGS, 0.25))
players$FT_SD <- (players$FTS - median(players$FTS))/(quantile(players$FTS, 0.75) - quantile(players$FTS, 0.25))
players$X3P_SD <- (players$X3P - median(players$X3P))/(quantile(players$X3P, 0.75) - quantile(players$X3P, 0.25))
players$PTS_SD <- (players$PTS - median(players$PTS))/(quantile(players$PTS, 0.75) - quantile(players$PTS, 0.25))
players$STL_SD <- (players$STL - median(players$STL))/(quantile(players$STL, 0.75) - quantile(players$STL, 0.25))
players$BLK_SD <- (players$BLK - median(players$BLK))/(quantile(players$BLK, 0.75) - quantile(players$BLK, 0.25))
players$TOV_SD <- -(players$TOV - median(players$TOV))/(quantile(players$TOV, 0.75) - quantile(players$TOV, 0.25))
players$AST_SD <- (players$AST - median(players$AST))/(quantile(players$AST, 0.75) - quantile(players$AST, 0.25))
players$TRB_SD <- (players$TRB - median(players$TRB))/(quantile(players$TRB, 0.75) - quantile(players$TRB, 0.25))
#players$CFOS <- players$BLK_SD + players$STL_SD + players$TRB_SD + players$AST_SD + players$PTS_SD + players$X3P_SD + players$TOV_SD + players$FT_SD + players$FG_SD
players$CFOS <- players$BLK_SD + players$STL_SD + players$TRB_SD + players$X3P_SD + players$TOV_SD + players$FG_SD
players.for.print <- players[,c("Player", "CFOS", "PTS_SD", "FG_SD", "FT_SD", "X3P_SD", "AST_SD", "TRB_SD", "STL_SD", "BLK_SD", "TOV_SD")]
write.xls(players.for.print, "ranking.xls")
calculate.score <- function(fg., fga, ft., fta, x3p, pts, stl, blk, tov, ast, trb) {
	player.fgs <- fga / max(players$FGA) * (fg. - median(players$FG.))/(quantile(players$FG., 0.75) - quantile(players$FG., 0.25))
	player.fts <- fta / max(players$FTA) * (ft. - median(players$FT.))/(quantile(players$FT., 0.75) - quantile(players$FT., 0.25))
	player.fg_sd <- (player.fgs - median(players$FGS))/(quantile(players$FGS, 0.75) - quantile(players$FGS, 0.25))
	player.ft_sd <- (player.fts - median(players$FTS))/(quantile(players$FTS, 0.75) - quantile(players$FTS, 0.25))
	player.x3p_sd <- (x3p - median(players$X3P))/(quantile(players$X3P, 0.75) - quantile(players$X3P, 0.25))
	player.pts_sd <- (pts - median(players$PTS))/(quantile(players$PTS, 0.75) - quantile(players$PTS, 0.25))
	player.stl_sd <- (stl - median(players$STL))/(quantile(players$STL, 0.75) - quantile(players$STL, 0.25))
	player.blk_sd <- (blk - median(players$BLK))/(quantile(players$BLK, 0.75) - quantile(players$BLK, 0.25))
	player.tov_sd <- -(tov - median(players$TOV))/(quantile(players$TOV, 0.75) - quantile(players$TOV, 0.25))
	player.ast_sd <- (ast - median(players$AST))/(quantile(players$AST, 0.75) - quantile(players$AST, 0.25))
	player.trb_sd <- (trb - median(players$TRB))/(quantile(players$TRB, 0.75) - quantile(players$TRB, 0.25))
	player.cfos <- player.blk_sd + player.stl_sd + player.trb_sd + player.ast_sd + player.pts_sd + player.x3p_sd + player.tov_sd + player.ft_sd + player.fg_sd
	player <- c(player.cfos, player.pts_sd, player.fg_sd, player.ft_sd, player.x3p_sd, player.ast_sd, player.trb_sd, player.stl_sd, player.blk_sd, player.tov_sd)
	names(player) <- c("CFOS", "PTS_SD", "FG_SD", "FT_SD", "X3P_SD", "AST_SD", "TRB_SD", "STL_SD", "BLK_SD", "TOV_SD")
	return(player)
}
