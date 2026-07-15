const express = require("express");

const app = express();

app.use(express.json({ limit: "1mb" }));

const PORT = process.env.PORT || 8080;
const VERSION = "0.2.0";
const VERIFY_TOKEN = process.env.META_VERIFY_TOKEN;

app.get("/health", (req, res) => {
  res.status(200).json({
    ok: true,
    service: "whatsapp-ai-agent",
    version: VERSION,
    webhook: {
      enabled: true,
      verifyTokenConfigured: Boolean(VERIFY_TOKEN)
    }
  });
});

app.get("/", (req, res) => {
  res.status(200).send("WhatsApp AI Agent is running");
});

app.get("/webhook", (req, res) => {
  const mode = req.query["hub.mode"];
  const token = req.query["hub.verify_token"];
  const challenge = req.query["hub.challenge"];

  console.log(
    JSON.stringify({
      event: "webhook_verification_attempt",
      mode,
      tokenReceived: Boolean(token),
      challengeReceived: Boolean(challenge)
    })
  );

  if (!VERIFY_TOKEN) {
    console.error(
      JSON.stringify({
        event: "webhook_verification_failed",
        reason: "META_VERIFY_TOKEN_NOT_CONFIGURED"
      })
    );

    return res.status(500).send("Webhook verify token is not configured");
  }

  if (mode === "subscribe" && token === VERIFY_TOKEN) {
    console.log(
      JSON.stringify({
        event: "webhook_verified"
      })
    );

    return res.status(200).send(challenge);
  }

  console.warn(
    JSON.stringify({
      event: "webhook_verification_denied",
      reason: "INVALID_MODE_OR_TOKEN"
    })
  );

  return res.sendStatus(403);
});

app.post("/webhook", (req, res) => {
  console.log(
    JSON.stringify({
      event: "webhook_event_received",
      object: req.body?.object || null,
      hasEntry: Array.isArray(req.body?.entry),
      receivedAt: new Date().toISOString()
    })
  );

  res.sendStatus(200);
});

app.use((req, res) => {
  res.status(404).json({
    ok: false,
    error: "not_found",
    path: req.path
  });
});

app.listen(PORT, () => {
  console.log(
    JSON.stringify({
      event: "service_started",
      service: "whatsapp-ai-agent",
      version: VERSION,
      port: PORT
    })
  );
});
