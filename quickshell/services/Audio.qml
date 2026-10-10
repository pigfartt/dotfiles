// Audio.qml
pragma Singleton

import Quickshell
import Quickshell.Services.Pipewire
import QtQuick

Singleton {
    id: root

    readonly property PwNode sink: Pipewire.defaultAudioSink
    readonly property bool ready: sink !== null && sink.ready && sink.audio !== null

    readonly property real volume: ready ? sink.audio.volume : 0
    readonly property bool muted: ready ? sink.audio.muted : false
    readonly property int percent: Math.round(volume * 100)

    function changeVolume(delta) {
        if (!ready) return
        const v = Math.max(0, Math.min(1, sink.audio.volume + delta))
        sink.audio.volume = Math.round(v * 100) / 100
    }

    function toggleMute() {
        if (ready) sink.audio.muted = !sink.audio.muted
    }

    PwObjectTracker { objects: [root.sink] }
}
