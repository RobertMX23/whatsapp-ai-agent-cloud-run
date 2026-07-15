const express = require("express");

const app = express();

app.use(express.json());

const PORT = process.env.PORT || 8080;

app.get("/health", (req, res) => {
  res.status(200).json({
    ok: true,
    service: "whatsapp-ai-agent",
    version: "0.1.0"
  });
});

app.get("/", (req, res) => {
  res.status(200).send("WhatsApp AI Agent is running");
});

app.listen(PORT, () => {
  console.log(`whatsapp-ai-agent listening on port ${PORT}`);
});
