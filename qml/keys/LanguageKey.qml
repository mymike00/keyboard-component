/*
 * Copyright 2013 Canonical Ltd.
 *
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU Lesser General Public License as published by
 * the Free Software Foundation; version 3.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/>.
 */

import QtQuick 2.0

ActionKey {
    iconNormal: "language-chooser";
    iconShifted: "language-chooser";
    iconCapsLock: "language-chooser";

    padding: 0

    width: panel.keyWidth
    overridePressArea: true

    action: "language"

    onPressed: {
        if (maliit_input_method.useAudioFeedback)
            audioFeedback.play();

        if (maliit_input_method.useHapticFeedback)
            pressEffect.start();
    }

    onReleased: {
        panel.switchBack = false;

        if (maliit_input_method.previousLanguage && maliit_input_method.previousLanguage != maliit_input_method.activeLanguage) {
            var currentLanguage = maliit_input_method.activeLanguage
            maliit_input_method.activeLanguage = maliit_input_method.previousLanguage
            maliit_input_method.previousLanguage = currentLanguage
        } else {
            maliit_input_method.previousLanguage = maliit_input_method.activeLanguage
            canvas.languageMenuShown = true
        }
    }

    onPressAndHold: {
        if (maliit_input_method.useAudioFeedback)
            audioFeedback.play();

        if (maliit_input_method.useHapticFeedback)
            pressEffect.start();

        maliit_input_method.previousLanguage = maliit_input_method.activeLanguage
        canvas.languageMenuShown = true
    }
}
