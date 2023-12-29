ENGINE_MOUNT_PATH = null
SERVICE_WORKER_PATH = null

export function start(options) {
  ENGINE_MOUNT_PATH = options.mounted_path
  SERVICE_WORKER_PATH = options.server_worker_path

  document.addEventListener("turbo:load", () => {
    switch (Notification.permission) {
        case "granted":
            saveSubscription()
            return
        case "denied":
            // do nothing?
            return
        default:
            promptForNotifications()
    }
  })
}

function promptForNotifications() {
    const notificationsButton = document.getElementById("enable_notifications")
    if (!notificationsButton) return

    notificationsButton.style.display = null
    notificationsButton.addEventListener("click", event => {
        event.preventDefault()
        Notification.requestPermission()
            .then((permission) => {
                if (permission === "granted") {
                    setupSubscription()
                } else {
                    alert("Notifications declined")
                }
            })
            .catch(error => console.log("Notifications error", error))
            .finally(() => notificationsButton.style.display = "none")
    })
}

async function setupSubscription() {
    if (Notification.permission !== "granted") return
    if (!navigator.serviceWorker) return

    let key_bytes = document.querySelector("meta[name=web_push_public]")?.content
    let vapid = new Uint8Array(JSON.parse(key_bytes))

    await navigator.serviceWorker.register(SERVICE_WORKER_PATH)
    const registration = await navigator.serviceWorker.ready
    await registration.pushManager.subscribe({
        userVisibleOnly: true,
        applicationServerKey: vapid
    })

    await saveSubscription()
}

async function saveSubscription() {
    if (Notification.permission !== "granted") return
    if (!navigator.serviceWorker) return

    const registration = await navigator.serviceWorker.ready
    const subscription = await registration.pushManager.getSubscription()
    if (!subscription) return

    await fetch(`${ENGINE_MOUNT_PATH}/subscriptions`, {
        method: "POST",
        headers: {
            "Content-Type": "application/json",
        },
        body: JSON.stringify(subscription)
    })
}
