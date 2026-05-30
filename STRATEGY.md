# Strategy Logic — v33 Flip System

## Core Concept

A **flip strategy** means: long and short, never flat.

When the long signal closes → a short opens immediately.  
When the short signal closes → a long opens immediately.

The bot is always in a position. There is no "waiting on the sidelines."

This is the opposite of a strategy that only trades in one direction. It captures both uptrends and downtrends, which is why it performed well during the 2022 bear market while buy-and-hold strategies collapsed.

---

## Signal Logic

The strategy uses two components in combination:

1. **RSI momentum filter** — measures the strength and direction of recent price movement
2. **Price-based trend confirmation** — confirms the trend before entry

The combination prevents false signals in choppy, sideways markets while capturing sustained directional moves.

**Why not just RSI alone?**  
RSI by itself generates too many signals in ranging markets. Adding a price-based trend filter significantly reduces noise and improves the profit factor.

---

## Timeframe Selection

Each asset has a different volatility profile, which is why different timeframes are optimal:

| Asset | Timeframe | Reason |
|-------|-----------|--------|
| BTC | 6H | Filters intraday noise while capturing major moves |
| ETH | 7H | ETH has sharper short-term moves; 7H filters that noise |
| SOL | 5H | SOL's high volatility works well at slightly shorter intervals |

**The fee problem with shorter timeframes:**  
At 1H or 15M, Bybit perpetual fees eat into profits because you're taking more trades with smaller wins. The 5–7H range hits the sweet spot between trade frequency and profit per trade.

---

## Why Low Win Rate Works

The v33 strategy wins approximately 21–25% of its trades. Most traders would reject this immediately.

Here's why it still works:

```
Losing trades:  ~78% of all trades  →  small losses
Winning trades: ~22% of all trades  →  large winners

Profit Factor = Total Winning $ / Total Losing $
             = 2.81 (BTC)

For every $1 lost across all losing trades,
the strategy made $2.81 across all winning trades.
```

Trend-following strategies have low win rates by design. You take small losses when the trend doesn't materialize, and you hold large winners when it does. The asymmetry is the edge.

This is the same principle that drives many of the world's most successful systematic funds (Winton, Man AHL, Millburn).

---

## Execution Architecture

```
TradingView Pine Script
        ↓
   Alert triggers (webhook)
        ↓
   VPS (Linux, 24/7)
        ↓
   Python execution script
        ↓
   Bybit REST API
        ↓
   Perpetual position open/close
```

**TradingView** handles the signal logic. When a signal fires, it sends an HTTP webhook to the VPS.

**The VPS** runs a Python script that receives the webhook, parses the signal, and sends the appropriate order to Bybit via their REST API.

**Bybit** executes the trade on the perpetual contract.

No manual intervention. The bot runs continuously, 24/7.

---

## Risk Parameters

- **Leverage:** Set to your risk tolerance (1x–3x recommended for most accounts)
- **Position size:** Fixed % of account equity per trade
- **No stop loss on individual trades** — the flip itself is the exit
- **Max drawdown protection:** Monitored at the account level

---

## What This Is Not

- **Not a grid bot** — grid bots buy dips and sell rallies, designed for sideways markets. They get destroyed in strong trends (as happened in 2022).
- **Not DCA** — no averaging down into losing positions
- **Not AI/ML** — the signal logic is rule-based and transparent
- **Not a black box** — the TradingView scripts are published; you can read the code

---

## Live Status

Running on a live Bybit account with real capital. Same parameters as the published backtests.

---

*Full details and deployment options: [v33systematic.com](https://v33systematic.com)*
