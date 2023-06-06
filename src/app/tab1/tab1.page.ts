import { Component } from '@angular/core';
import { Capacitor } from '@capacitor/core';
import { Plugins } from '@capacitor/core';

const { Haptics } = Plugins;
const { MIAWPluginExample } = Plugins;

@Component({
  selector: 'app-tab1',
  templateUrl: 'tab1.page.html',
  styleUrls: ['tab1.page.scss'],
})

export class Tab1Page {
  async handleButtonClick() {
    if (Capacitor.isPluginAvailable('Haptics')) {
      await Haptics.vibrate();
    }
  }

  async startConversation() {
    const result = await MIAWPluginExample.startConversation()
    console.log("it did a thing")
  }
}

