WITH mined_block AS (
  SELECT miner, DATE(timestamp)
  FROM `crypto-etl-ethereum-dev.classic_blockchain.blocks` 
  WHERE DATE(timestamp) > DATE_SUB(CURRENT_DATE(), INTERVAL 1 MONTH)
  ORDER BY miner ASC)
SELECT miner, COUNT(miner) AS total_block_reward 
FROM mined_block 
GROUP BY miner 
ORDER BY total_block_reward ASC
