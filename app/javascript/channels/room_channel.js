import consumer from "./consumer"
import $ from "jquery";
consumer.subscriptions.create("RoomChannel", {
  connected() {
    console.log('connected room channel');
    // Called when the subscription is ready for use on the server
  },

  disconnected() {
    // Called when the subscription has been terminated by the server
  },

  received(data) {
    this.notification_order(data);

    // Called when there's incoming data on the websocket for this channel
  },
  notification_order(data){
    var message = `Đơn hàng #${data.order.id} vừa được đặt`;
    $('#myAlert').addClass('show');
    $('.myAlert-message').html(message);
    setTimeout(() => {
      $('#myAlert').removeClass('show');
    }, 2000);
  }
});
