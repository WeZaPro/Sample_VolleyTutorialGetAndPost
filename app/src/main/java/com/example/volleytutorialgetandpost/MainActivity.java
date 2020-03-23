package com.example.volleytutorialgetandpost;

import androidx.appcompat.app.AppCompatActivity;

import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.TextView;
import android.widget.Toast;

import com.android.volley.AuthFailureError;
import com.android.volley.Request;
import com.android.volley.RequestQueue;
import com.android.volley.Response;
import com.android.volley.VolleyError;
import com.android.volley.toolbox.StringRequest;
import com.android.volley.toolbox.Volley;

import org.json.JSONObject;

import java.util.HashMap;
import java.util.Map;

public class MainActivity extends AppCompatActivity {

    private TextView get_response_text,post_response_text;
    EditText editText;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
        Button get_request_button=findViewById(R.id.get_data);
        Button post_request_button=findViewById(R.id.post_data);

        get_response_text=findViewById(R.id.get_respone_data);
        post_response_text=findViewById(R.id.post_respone_data);

        editText=findViewById(R.id.editText);


        get_request_button.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                sendGetRequest();
            }
        });

        post_request_button.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                postRequest();
            }
        });
    }

    private void postRequest() {
        RequestQueue requestQueue=Volley.newRequestQueue(MainActivity.this);
        String url="http://192.168.64.2/test_volley_library/app1/post_data.php";
        StringRequest stringRequest=new StringRequest(Request.Method.POST, url, new Response.Listener<String>() {
            @Override
            public void onResponse(String response) {
                //let's parse json data
                try {
                    JSONObject jsonObject = new JSONObject(response);
                    post_response_text.setText("Data Name : " + jsonObject.getString("name")+"\n");
                    post_response_text.append("Data Email : " + jsonObject.getString("email")+"\n");
                    post_response_text.append("Data Address : " + jsonObject.getString("address")+"\n");

                }
                catch (Exception e){
                    e.printStackTrace();
                    post_response_text.setText("POST DATA : unable to Parse Json");
                }
            }
        }, new Response.ErrorListener() {
            @Override
            public void onErrorResponse(VolleyError error) {
                post_response_text.setText("Post Data : Response Failed");
            }
        }){
            @Override
            protected Map<String,String> getParams(){
                Map<String,String> params=new HashMap<String, String>();
                params.put("name","taweesaks");
                params.put("password","1234");
                params.put("address","Bangpakong");
                params.put("email","tawee@gmail.com");
                params.put("phone","0873695050");
                return params;
            }

            @Override
            public Map<String,String> getHeaders() throws AuthFailureError{
                Map<String,String> params=new HashMap<String, String>();
                params.put("Content-Type","application/x-www-form-urlencoded");
                return params;
            }
        };

        requestQueue.add(stringRequest);

    }

    private void sendGetRequest() {
        //get working now
        //let's try post and send some data to server
        //RequestQueue queue= Volley.newRequestQueue(MainActivity.this);
        String url="http://192.168.64.2/test_volley_library/app1/get_data.php";
        StringRequest stringRequest=new StringRequest(Request.Method.POST, url, new Response.Listener<String>() {
            @Override
            public void onResponse(String response) {
                get_response_text.setText("Data : "+response);
                try {
                    JSONObject jsonObject = new JSONObject(response);
                    get_response_text.setText("name :"+jsonObject.getString("name")+"\n");
                    get_response_text.append("email :"+jsonObject.getString("email")+"\n");
                    get_response_text.append("address :"+jsonObject.getString("address")+"\n");

                }
                catch (Exception e){
                    e.printStackTrace();
                    get_response_text.setText("Failed to Parse Json");
                }

            }
        }, new Response.ErrorListener() {
            @Override
            public void onErrorResponse(VolleyError error) {
                get_response_text.setText("Data : Response Failed");
            }
        }){
            @Override
            protected Map<String, String> getParams() throws AuthFailureError {

                Map<String, String> params = new HashMap<String, String>();

                    params.put("user_id", editText.getText().toString());

                return params;
            }
        };

        RequestQueue queue= Volley.newRequestQueue(MainActivity.this);
        queue.add(stringRequest);
    }
}
