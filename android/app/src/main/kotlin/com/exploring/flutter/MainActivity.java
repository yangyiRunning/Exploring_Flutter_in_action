package com.exploring.flutter;

import android.content.ContextWrapper;
import android.content.Intent;
import android.content.IntentFilter;
import android.os.BatteryManager;
import android.os.Build;
import android.os.Bundle;

import com.exploring.flutter.activity.AboutActivity;
import com.exploring.flutter.util.DeviceUtil;

import io.flutter.app.FlutterActivity;
import io.flutter.plugin.common.MethodChannel;

/**
 * @author yangyi
 * @email yangyirunning@163.com
 */
public class MainActivity extends FlutterActivity {

    private static final String CHANNEL = "com.exploring.flutter/device";
    private static final String GET_BATTERY_LEVEL = "getBatteryLevel";
    private static final String GET_SYSTEM_VERSION = "getSystemVersion";
    private static final String GET_SYSTEM_LANGUAGE = "getSystemLanguage";
    private static final String GET_SYSTEM_LANGUAGE_LIST = "getSystemLanguageList";
    private static final String GET_SYSTEM_MODEL = "getSystemModel";
    private static final String GET_SYSTEM_DEVICE = "getSystemDevice";
    private static final String GET_DEVICE_BRAND = "getDeviceBrand";
    private static final String GET_DEVICE_BOARD = "getDeviceBoard";
    private static final String GET_DEVICE_MANUFACTURER = "getDeviceManufacturer";
    private static final String GO_TO_ANDROID_ABOUT_ACTIVITY = "goToAndroidAboutActivity";

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        MethodChannel methodChannel = new MethodChannel(getFlutterView(), CHANNEL);
        methodChannel.setMethodCallHandler(
                (call, result) -> {
                    if (GET_BATTERY_LEVEL.equals(call.method)) {
                        int batteryLevel = getBatteryLevel();
                        if (batteryLevel != -1) {
                            result.success(batteryLevel);
                        } else {
                            result.error("UNAVAILABLE", "Battery level not available.", null);
                        }
                    } else if (GET_SYSTEM_VERSION.equals(call.method)) {
                        result.success(DeviceUtil.getSystemVersion());
                    } else if (GET_SYSTEM_LANGUAGE.equals(call.method)) {
                        result.success(DeviceUtil.getSystemLanguage());
                    } else if (GET_SYSTEM_LANGUAGE_LIST.equals(call.method)) {
                        result.success(DeviceUtil.getSystemLanguageList());
                    } else if (GET_SYSTEM_MODEL.equals(call.method)) {
                        result.success(DeviceUtil.getSystemModel());
                    } else if (GET_SYSTEM_DEVICE.equals(call.method)) {
                        result.success(DeviceUtil.getSystemDevice());
                    } else if (GET_DEVICE_BRAND.equals(call.method)) {
                        result.success(DeviceUtil.getDeviceBrand());
                    } else if (GET_DEVICE_BOARD.equals(call.method)) {
                        result.success(DeviceUtil.getDeviceBoard());
                    } else if (GET_DEVICE_MANUFACTURER.equals(call.method)) {
                        result.success(DeviceUtil.getDeviceManufacturer());
                    } else if (GO_TO_ANDROID_ABOUT_ACTIVITY.equals(call.method)) {
                        Intent intent = new Intent(this, AboutActivity.class);
                        startActivity(intent);
                    } else {
                        result.notImplemented();
                    }
                });
    }

    private int getBatteryLevel() {
        int batteryLevel = -1;
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.LOLLIPOP) {
            BatteryManager batteryManager = (BatteryManager) getSystemService(BATTERY_SERVICE);
            batteryLevel = batteryManager.getIntProperty(BatteryManager.BATTERY_PROPERTY_CAPACITY);
        } else {
            Intent intent = new ContextWrapper(getApplicationContext()).
                    registerReceiver(null, new IntentFilter(Intent.ACTION_BATTERY_CHANGED));
            if (intent != null) {
                batteryLevel = (intent.getIntExtra(BatteryManager.EXTRA_LEVEL, -1) * 100) /
                        intent.getIntExtra(BatteryManager.EXTRA_SCALE, -1);
            }
        }

        return batteryLevel;
    }

}
