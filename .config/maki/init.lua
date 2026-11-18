maki.setup({
  always_workflow = true,
  always_thinking = "high",
  provider = {
    default_model = "desy/reasoning",
    -- A 5xx, a network error and a 429 carrying Retry-After are retried
    -- without a ceiling, in every session. The two bounded budgets are the
    -- ones that end in an error, so widen those: a refused connection and
    -- an unhinted 429 share max_retries, stream timeouts draw on
    -- max_timeout_retries. Backoff grows linearly to retry_max_ms, so 30
    -- retries sit out roughly eight minutes.
    max_retries = 30,
    max_timeout_retries = 20,
  },
  plugins = {
    task = {
      allow_model = true,
    },
  },
})
