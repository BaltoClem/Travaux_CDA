package org.afpa.listepersonne;


import android.content.Context;
import android.util.Log;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.BaseAdapter;
import android.widget.ImageView;
import android.widget.TextView;

import java.util.List;

public class CustomListAdaptater extends BaseAdapter {

    private final List<UserAccount> listUser;
    private final LayoutInflater layoutInflater;
    private final Context context;

    public CustomListAdaptater(List<UserAccount> listUser, Context context) {
        this.listUser = listUser;
        layoutInflater = LayoutInflater.from(context);
        this.context = context;
    }

    static class ViewHolder{
        ImageView rolePicView;
        TextView userNameView;
        TextView roleView;
    }

    public int getMipmapResIdByName(String resName)  {
        String pkgName = context.getPackageName();
        // Return 0 if not found.
        int resID = context.getResources().getIdentifier(resName , "mipmap", pkgName);
        Log.i("unliste", "Res Name: "+ resName+"==> Res ID = "+ resID);
        return resID;
    }

    @Override
    public int getCount() {
        return listUser.size();
    }

    @Override
    public Object getItem(int position) {
        return listUser.get(position);
    }

    @Override
    public long getItemId(int position) {
        return position;
    }

    @Override
    public View getView(int position, View convertView, ViewGroup parent) {
        ViewHolder holder;
        if(convertView == null){
            convertView = layoutInflater.inflate(R.layout.liste_item_layout,null);
            holder = new ViewHolder();
            holder.rolePicView = (ImageView) convertView.findViewById(R.id.imageView_role);
            holder.userNameView = (TextView) convertView.findViewById(R.id.textView_name);
            holder.roleView = (TextView) convertView.findViewById(R.id.textView_role);
            convertView.setTag(holder);
        } else {
            holder = (ViewHolder) convertView.getTag();
        }

        UserAccount user = this.listUser.get(position);
        holder.userNameView.setText(user.getUserName());
        holder.roleView.setText("Role: "+ user.getUserType());

        int imageId = this.getMipmapResIdByName(user.getUserType());

        holder.rolePicView.setImageResource(imageId);
        return convertView;
    }
}
