import oracle.kv.KVStore;
import oracle.kv.KVStoreConfig;
import oracle.kv.KVStoreFactory;
import oracle.kv.Key;
import oracle.kv.Value;
import oracle.kv.ValueVersion;
import java.util.ArrayList;

class LoadDB {

	public static void main(String args[]) {
		try
		{

			String storeName = "kvstore";
			String hostName = "localhost";
			String hostPort = "5000";

			KVStore store;

			ArrayList<String> majorList = new ArrayList<String>();
			ArrayList<String> minorList = new ArrayList<String>();
			Key key;
			Value value;
			String valueString;

			store = KVStoreFactory.getStore(new KVStoreConfig("kvstore", "localhost" + ":" + "5000"));
			System.out.println("Store " + storeName + " at " + hostName + ":" + hostPort + " opened.");

			majorList.add("James");
			majorList.add("Marino");
			majorList.add("1995");
			minorList.add("nationality");
			valueString = "Australian";
			key = Key.createKey(majorList, minorList);
			value = Value.createValue(valueString.getBytes());
			store.put(key, value);
			majorList.clear();
			minorList.clear();

			majorList.add("Chris");
			majorList.add("Southcott");
			majorList.add("1994");
			minorList.add("nationality");
			valueString = "Chinese";
			key = Key.createKey(majorList, minorList);
			value = Value.createValue(valueString.getBytes());
			store.put(key, value);
			majorList.clear();
			minorList.clear();

			majorList.add("Dave");
			majorList.add("Barranquero");
			majorList.add("1990");
			minorList.add("nationality");
			valueString = "Sri Lanka";
			key = Key.createKey(majorList, minorList);
			value = Value.createValue(valueString.getBytes());
			store.put(key, value);
			majorList.clear();
			minorList.clear();

			store.close();
			System.out.println("Store " + storeName + " at " + hostName + ":" + hostPort + " closed.");
		}
		catch (RuntimeException e) {
			e.printStackTrace();
		}
	}
}