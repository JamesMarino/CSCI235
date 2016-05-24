import oracle.kv.KVStore;
import oracle.kv.KVStoreConfig;
import oracle.kv.KVStoreFactory;
import oracle.kv.Key;
import oracle.kv.Value;
import oracle.kv.ValueVersion;
import oracle.kv.KeyValueVersion;
import oracle.kv.Direction;

import java.util.ArrayList;
import java.util.Iterator;

class FindTeam {

	public static void main(String args[]) {
		try {

			String storeName = "kvstore";
			String hostName = "localhost";
			String hostPort = "5000";

			ArrayList<String> majorComponents = new ArrayList<String>();

			KVStore store;

			store = KVStoreFactory.getStore(new KVStoreConfig(storeName, hostName + ":" + hostPort));
			System.out.println("Store " + storeName + " at " + hostName + ":" + hostPort + " opened.");

			majorComponents.add("James");
			Key key = Key.createKey(majorComponents);
			Iterator<KeyValueVersion> it = store.storeIterator(Direction.UNORDERED, 0, key, null, null);
			while (it.hasNext() )
			{
				KeyValueVersion kvvi = it.next();
				System.out.println(kvvi.getKey().toString() + " \t\t\t " + new String(kvvi.getValue().getValue() ) );
			}
			store.close();
			System.out.println("Store " + storeName + " at " + hostName + ":" + hostPort + " closed.");

		}
		catch (RuntimeException e) {
			e.printStackTrace();
		}
	}
}