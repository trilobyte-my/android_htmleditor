package com.chimou.android_htmleditor

import androidx.annotation.NonNull
import android.content.Context
import android.content.Intent
import android.app.Activity
import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result
import io.flutter.plugin.common.PluginRegistry.Registrar
import io.flutter.plugin.common.PluginRegistry.ActivityResultListener
import io.flutter.embedding.engine.plugins.activity.ActivityAware
import io.flutter.embedding.engine.plugins.activity.ActivityPluginBinding

/** AndroidHtmleditorPlugin
this plugin does not support Flutter pre-1.12.*
*/
public class AndroidHtmleditorPlugin: FlutterPlugin, MethodCallHandler, ActivityResultListener, ActivityAware {

  companion object {
    const val EDIT_REQUEST = 1
  }

  var result: Result? = null
  var activity: Activity? = null
  var context: Context? = null

  override fun onAttachedToEngine(@NonNull flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
    val channel = MethodChannel(flutterPluginBinding.getFlutterEngine().getDartExecutor(), "android_htmleditor")
    context = flutterPluginBinding.applicationContext
    channel.setMethodCallHandler(this)
  }

  override fun onDetachedFromEngine(@NonNull binding: FlutterPlugin.FlutterPluginBinding) {
    // do nothing
  }

  override fun onAttachedToActivity(@NonNull binding: ActivityPluginBinding) {
    binding.addActivityResultListener(this)
    activity = binding.activity
  }

  override fun onDetachedFromActivity()
  {
    // do nothing
  }

  override fun onReattachedToActivityForConfigChanges(@NonNull p0: ActivityPluginBinding)
  {
    // do nothing
  }

  override fun onDetachedFromActivityForConfigChanges()
  {
    // do nothing
  }

  override fun onMethodCall(@NonNull call: MethodCall, @NonNull result: Result) {
    if (call.method == "getPlatformVersion") {
      result.success("Android ${android.os.Build.VERSION.RELEASE}")
    } else if (call.method == "edit") {
      edit(call.argument("content"), result)
    } else {
      result.notImplemented()
    }
  }

  // main plugin code
  fun edit(content: String?, @NonNull result: Result) {
    this.result = result
    val intent = Intent(context, AndroidHtmleditorActivity::class.java)
    intent.putExtra("content", content)
    activity!!.startActivityForResult(intent, EDIT_REQUEST)
  }

  override public fun onActivityResult(requestCode: Int, resultCode: Int, data: Intent?): Boolean {

    if (result == null) { return false }

    if (requestCode == EDIT_REQUEST)
    {
      if (resultCode == Activity.RESULT_OK) {
        result!!.success(data?.getStringExtra("content"))
      }
    }
    return true
  }
}
