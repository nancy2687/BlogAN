```javascript
(function () {
  const VAPID_PUBLIC_KEY =
    "BA1mjRzkLHqhWgj4Xfz-Ah-qSiJoUh0Fm6x7_e03i_or_CNkcNnAKg_Wf-tFMQPUqqUOwSAHeDUFHllgCOas2SM";

  const SUBSCRIBE_URL =
    "https://blogan-push.amblludivine669-996.workers.dev/subscribe";

  function base64UrlToUint8Array(base64String) {
    const padding = "=".repeat((4 - (base64String.length % 4)) % 4);
    const base64 = (base64String + padding)
      .replace(/-/g, "+")
      .replace(/_/g, "/");

    const raw = atob(base64);
    return Uint8Array.from(raw, (character) => character.charCodeAt(0));
  }

  window.bloganSubscribe = async function () {
    if (!("serviceWorker" in navigator) || !("PushManager" in window)) {
      throw new Error(
        "Ce navigateur ne prend pas en charge les notifications Web Push."
      );
    }

    if (!("Notification" in window)) {
      throw new Error("Les notifications ne sont pas disponibles.");
    }

    const permission = await Notification.requestPermission();

    if (permission !== "granted") {
      throw new Error("Autorisation des notifications refusée.");
    }

    const registration = await navigator.serviceWorker.register(
      "/BlogAN/push-sw.js",
      { scope: "/BlogAN/" }
    );

    const existing = await registration.pushManager.getSubscription();

    const subscription =
      existing ||
      (await registration.pushManager.subscribe({
        userVisibleOnly: true,
        applicationServerKey: base64UrlToUint8Array(VAPID_PUBLIC_KEY),
      }));

    const response = await fetch(SUBSCRIBE_URL, {
      method: "POST",
      headers: {
        "Content-Type": "application/json",
      },
      body: JSON.stringify(subscription),
    });

    const result = await response.json();

    if (!response.ok || result.success !== true) {
      throw new Error(
        result.error || "Le serveur n'a pas enregistré l'abonnement."
      );
    }

    return {
      success: true,
      message: "Notifications activées avec succès !",
    };
  };
})();
```
