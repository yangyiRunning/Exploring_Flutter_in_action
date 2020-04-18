package com.exploring.flutter.activity;

import android.app.ActionBar;
import android.app.Activity;
import android.os.Bundle;
import android.view.MenuItem;

import com.exploring.flutter.R;

import androidx.annotation.Nullable;
import androidx.core.content.ContextCompat;

/**
 * @author yangyi
 * @email yangyirunning@163.com
 */
public class AboutActivity extends Activity {

    @Override
    protected void onCreate(@Nullable Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_about);

        ActionBar actionBar = getActionBar();
        if (actionBar != null) {
            actionBar.setTitle("Android原生界面");
            actionBar.setBackgroundDrawable(
                    ContextCompat.getDrawable(this, R.drawable.actionvar_background));
            actionBar.setDisplayHomeAsUpEnabled(true);
        }
    }

    @Override
    public boolean onOptionsItemSelected(MenuItem item) {
        if (item.getItemId() == android.R.id.home) {
            if (!isFinishing()) {
                finish();
            }
        }
        return super.onOptionsItemSelected(item);
    }
}
