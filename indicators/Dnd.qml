import QtQuick
import qs.Commons
import qs.Ui

BarIndicator {
  id: root

  readonly property string notificationServiceId: bar?.shell?.pluginRegistry?.resolveEnabledId
    ? bar.shell.pluginRegistry.resolveEnabledId("omarchy.notifications")
    : "omarchy.notifications"
  readonly property var notificationService: bar?.shell?.serviceFor(notificationServiceId)
  readonly property bool dnd: notificationService ? notificationService.doNotDisturb : false

  active: dnd
  activeText: "󰂛"
  inactiveText: "󰂛"
  activeTooltipText: "Allow Notifications"
  inactiveTooltipText: "Silence Notifications"

  onPressed: function() {
    if (root.notificationService) {
      root.notificationService.setDoNotDisturb(!root.notificationService.doNotDisturb)
    }
  }
}
