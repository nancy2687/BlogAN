self.addEventListener("push", (event) => {
  let data = {
    title: "BlogAN 💙",
    body: "Un nouvel article est disponible !",
    url: "./"
  };

  if (event.data) {
    try {
      data = { ...data, ...event.data.json() };
    } catch (_) {}
  }

  event.waitUntil(
    self.registration.showNotification(data.title, {
      body: data.body,
      icon: "icons/Icon-192.png",
      data: { url: data.url || "./" }
    })
  );
});

self.addEventListener("notificationclick", (event) => {
  event.notification.close();

  event.waitUntil(
    clients.openWindow(
      new URL(event.notification.data.url || "./", self.registration.scope).href
    )
  );
});
