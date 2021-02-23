package com.sangs.support;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.Map;
import java.util.Set;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

/**
 * 
 */
public class DataMap extends DataProtocol {

    private static final long serialVersionUID = 4746321419509587063L;

    private Logger            log              = LogManager.getLogger(this.getClass());

    private boolean           debug            = Boolean.valueOf(SangsProperties.getProperty("Globals.dataMapDebug")).booleanValue();

    public DataMap(String s) {
        name = s;
    }

    public DataMap(int i, float f) {
        super(i, f);
    }

    public DataMap(int i) {
        super(i);
    }

    public DataMap() {

    }

    public DataMap(Map map) {
        super(map);
    }

    public DataMap(int i, float f, boolean flag) {
        super(i, f, flag);
    }

    public void set(Object obj, Object obj1) {
        ArrayList arraylist = new ArrayList(1);
        arraylist.add(obj1);
        super.put(obj, arraylist);
    }

    public void setString(Object obj, String s) {
        ArrayList arraylist = new ArrayList(1);
        arraylist.add(s);
        super.put(obj, arraylist);
    }

    public void putString(Object obj, String s) {
        ArrayList arraylist = new ArrayList(1);
        arraylist.add(s);
        super.put(obj, arraylist);
    }

    public void setInt(Object obj, int i) {
        Integer integer = new Integer(i);
        ArrayList arraylist = new ArrayList(1);
        arraylist.add(integer);
        super.put(obj, arraylist);
    }

    public void putInt(Object obj, int i) {
        Integer integer = new Integer(i);
        ArrayList arraylist = new ArrayList(1);
        arraylist.add(integer);
        super.put(obj, arraylist);
    }

    public void setDouble(Object obj, double d) {
        Double double1 = new Double(d);
        ArrayList arraylist = new ArrayList(1);
        arraylist.add(double1);
        super.put(obj, arraylist);
    }

    public void putDouble(Object obj, double d) {
        Double double1 = new Double(d);
        ArrayList arraylist = new ArrayList(1);
        arraylist.add(double1);
        super.put(obj, arraylist);
    }

    public void setFloat(Object obj, float f) {
        Float float1 = new Float(f);
        ArrayList arraylist = new ArrayList(1);
        arraylist.add(float1);
        super.put(obj, arraylist);
    }

    public void putFloat(Object obj, float f) {
        Float float1 = new Float(f);
        ArrayList arraylist = new ArrayList(1);
        arraylist.add(float1);
        super.put(obj, arraylist);
    }

    public void setLong(Object obj, long l) {
        Long long1 = new Long(l);
        ArrayList arraylist = new ArrayList(1);
        arraylist.add(long1);
        super.put(obj, arraylist);
    }

    public void putLong(Object obj, long l) {
        Long long1 = new Long(l);
        ArrayList arraylist = new ArrayList(1);
        arraylist.add(long1);
        super.put(obj, arraylist);
    }

    public void setShort(Object obj, short word0) {
        Short short1 = new Short(word0);
        ArrayList arraylist = new ArrayList(1);
        arraylist.add(short1);
        super.put(obj, arraylist);
    }

    public void putShort(Object obj, short word0) {
        Short short1 = new Short(word0);
        ArrayList arraylist = new ArrayList(1);
        arraylist.add(short1);
        super.put(obj, arraylist);
    }

    public void setBoolean(Object obj, boolean flag) {
        Boolean boolean1 = flag;
        ArrayList arraylist = new ArrayList(1);
        arraylist.add(boolean1);
        super.put(obj, arraylist);
    }

    public void putBoolean(Object obj, boolean flag) {
        Boolean boolean1 = flag;
        ArrayList arraylist = new ArrayList(1);
        arraylist.add(boolean1);
        super.put(obj, arraylist);
    }

    public void add(Object obj, Object obj1) {
        if (!super.containsKey(obj)) {
            ArrayList arraylist = new ArrayList();
            arraylist.add(obj1);
            super.put(obj, arraylist);
        } else {
            ArrayList arraylist1 = (ArrayList)super.get(obj);
            arraylist1.add(obj1);
        }
    }

    public void addString(Object obj, String s) {
        if (!super.containsKey(obj)) {
            ArrayList arraylist = new ArrayList();
            arraylist.add(s);
            super.put(obj, arraylist);
        } else {
            ArrayList arraylist1 = (ArrayList)super.get(obj);
            arraylist1.add(s);
        }
    }

    public void addInt(Object obj, int i) {
        Integer integer = new Integer(i);
        if (!super.containsKey(obj)) {
            ArrayList arraylist = new ArrayList();
            arraylist.add(integer);
            super.put(obj, arraylist);
        } else {
            ArrayList arraylist1 = (ArrayList)super.get(obj);
            arraylist1.add(integer);
        }
    }

    public void addDouble(Object obj, double d) {
        Double double1 = new Double(d);
        if (!super.containsKey(obj)) {
            ArrayList arraylist = new ArrayList();
            arraylist.add(double1);
            super.put(obj, arraylist);
        } else {
            ArrayList arraylist1 = (ArrayList)super.get(obj);
            arraylist1.add(double1);
        }
    }

    public void addFloat(Object obj, float f) {
        Float float1 = new Float(f);
        if (!super.containsKey(obj)) {
            ArrayList arraylist = new ArrayList();
            arraylist.add(float1);
            super.put(obj, arraylist);
        } else {
            ArrayList arraylist1 = (ArrayList)super.get(obj);
            arraylist1.add(float1);
        }
    }

    public void addLong(Object obj, long l) {
        Long long1 = new Long(l);
        if (!super.containsKey(obj)) {
            ArrayList arraylist = new ArrayList();
            arraylist.add(long1);
            super.put(obj, arraylist);
        } else {
            ArrayList arraylist1 = (ArrayList)super.get(obj);
            arraylist1.add(long1);
        }
    }

    public void addShort(Object obj, short word0) {
        Short short1 = new Short(word0);
        if (!super.containsKey(obj)) {
            ArrayList arraylist = new ArrayList();
            arraylist.add(short1);
            super.put(obj, arraylist);
        } else {
            ArrayList arraylist1 = (ArrayList)super.get(obj);
            arraylist1.add(short1);
        }
    }

    public void addBoolean(Object obj, boolean flag) {
        Boolean boolean1 = flag;
        if (!super.containsKey(obj)) {
            ArrayList arraylist = new ArrayList();
            arraylist.add(boolean1);
            super.put(obj, arraylist);
        } else {
            ArrayList arraylist1 = (ArrayList)super.get(obj);
            arraylist1.add(boolean1);
        }
    }

    public Object get(Object obj) {
        if (debug) {
            if (!super.containsKey(obj)) {
            }
        }

        ArrayList arr = (ArrayList)super.get(obj);

        if (arr == null) {
            if (nullToInitialize) return "";
            else return null;
        } else {
            return arr.get(0);
        }
    }

    public int getInt(Object obj) {
        if (debug) {
            if (!super.containsKey(obj)) {
            }
        }

        ArrayList arr = (ArrayList)super.get(obj);

        if (arr == null) {
            if (nullToInitialize) {
                return 0;
            } else {
                throw new RuntimeException("[Exception in DataMap] Value Type(int) does not match : It's type is not int.");
            }

        } else {
            Object obj1 = arr.get(0);
            if (obj1 == null) {
                if (nullToInitialize) {
                    return 0;
                } else {
                    throw new RuntimeException("[Exception in DataMap] Value Type(int) does not match : It's type is not int.");
                }
            } else {
                Class class1 = obj1.getClass();
                if (class1 == java.lang.Integer.class) return ((Integer)arr.get(0)).intValue();
                if (class1 == java.lang.Short.class) return ((Short)arr.get(0)).shortValue();
                if (class1 == java.lang.String.class) {
                    try {
                        return Integer.parseInt(arr.get(0).toString());
                    } catch (Exception exception) {
                        throw new RuntimeException("[Exception in DataMap] Value Type(int) does not match : It's type is not int.");
                    }
                } else {
                    throw new RuntimeException("[Exception in DataMap] Value Type(int) does not match : It's type is not int.");
                }
            }
        }
    }

    public double getDouble(Object obj) {
        if (debug) {
            if (!super.containsKey(obj)) {
            }
        }
        ArrayList arr = (ArrayList)super.get(obj);

        if (arr != null) {
            Object obj1 = arr.get(0);
            if (obj1 == null || obj1.toString().equals("")) if (nullToInitialize) {
                return 0.0D;
            } 
            
            Class class1 = obj1.getClass();
            if (class1 == java.lang.Double.class) return ((Double)obj1).doubleValue();
            if (class1 == java.lang.Float.class) return (double)((Float)obj1).floatValue();
            if (class1 == java.lang.Integer.class) return (double)((Integer)obj1).intValue();
            if (class1 == java.lang.Long.class) return (double)((Long)obj1).longValue();
            if (class1 == java.lang.String.class) {
                try {
                    if (obj1.toString().length() == 0 || obj1.toString().equals("")) return 0.0D;
                    else return Double.parseDouble(obj1.toString());
                } catch (Exception exception) {
                }
                throw new RuntimeException("[Exception in DataMap] Value Type(double) does not match : It's type is not double.");

            } else {
                throw new RuntimeException("[Exception in DataMap] Value Type(double) does not match : It's type is not double.");
            }
        } else {
            if (nullToInitialize) {
                return 0.0D;
            } else {
                throw new RuntimeException("[Exception in DataMap] Key(" + obj + ") does not exist in " + name + " DataMap or Key(" + obj + ")'s value is null.");
            }
        }
    }

    public float getFloat(Object obj) {
        if (debug) {
            if (!super.containsKey(obj)) {
            }
        }

        ArrayList arr = (ArrayList)super.get(obj);

        if (arr != null) {
            Object obj1 = arr.get(0);
            if (obj1 == null || obj1.toString().equals("")) if (nullToInitialize) {
                return 0.0F;
            } 
            Class class1 = obj1.getClass();
            if (class1 == java.lang.Float.class) return ((Float)obj1).floatValue();
            if (class1 == java.lang.String.class) {
                try {
                    return Float.parseFloat(obj1.toString());
                } catch (Exception exception) {
                }
                throw new RuntimeException("[Exception in DataMap] Value Type(float) does not match : It's type is not float.");
            } else {
                throw new RuntimeException("[Exception in DataMap] Value Type(float) does not match : It's type is not float.");
            }
        } else {
            if (nullToInitialize) {
                return 0.0F;
            } else {
                throw new RuntimeException("[Exception in DataMap] Key(" + obj + ") does not exist in " + name + " DataMap or Key(" + obj + ")'s value is null.");
            }
        }
    }

    public long getLong(Object obj) {
        if (debug) {
            if (!super.containsKey(obj)) {
            }
        }

        ArrayList arr = (ArrayList)super.get(obj);

        if (arr != null) {
            Object obj1 = arr.get(0);
            if (obj1 == null || obj1.toString().equals("")) if (nullToInitialize) {
                return 0L;
            } 
            Class class1 = obj1.getClass();
            if (class1 == java.lang.Long.class) return ((Long)obj1).longValue();
            if (class1 == java.lang.Integer.class) return (long)((Integer)obj1).intValue();
            if (class1 == java.lang.Short.class) return (long)((Short)obj1).shortValue();
            if (class1 == java.lang.String.class) {
                try {
                    return Long.parseLong(obj1.toString());
                } catch (Exception exception) {
                }
                throw new RuntimeException("[Exception in DataMap] Value Type(long) does not match : It's type is not long.");
            } else {
                throw new RuntimeException("[Exception in DataMap] Value Type(long) does not match : It's type is not long.");
            }
        } else {
            if (nullToInitialize) {
                return 0L;
            } else {
                throw new RuntimeException("[Exception in DataMap] Key(" + obj + ") does not exist in " + name + " DataMap or Key(" + obj + ")'s value is null.");
            }
        }

    }

    public short getShort(Object obj) {
        if (debug) {
            if (!super.containsKey(obj)) {
            }
        }
        ArrayList arr = (ArrayList)super.get(obj);

        if (arr != null) {
            Object obj1 = arr.get(0);

            if (obj1 == null || obj1.toString().equals("")) {
                if (nullToInitialize) {
                    return 0;
                } else {
                    throw new RuntimeException("[Exception in DataMap] Key(" + obj + ") does not exist in " + name + " DataMap or Key(" + obj + ")'s value is null.");
                }
            }
            Class class1 = obj1.getClass();
            if (class1 == java.lang.Short.class) return ((Short)obj1).shortValue();
            if (class1 == java.lang.String.class) {
                try {
                    return Short.parseShort(obj1.toString());
                } catch (Exception exception) {
                }
                throw new RuntimeException("[Exception in DataMap] Value Type(short) does not match : It's type is not short.");
            } else {
                throw new RuntimeException("[Exception in DataMap] Value Type(short) does not match : It's type is not short.");
            }
        } else {
            if (nullToInitialize) {
                return 0;
            } else {
                throw new RuntimeException("[Exception in DataMap] Key(" + obj + ") does not exist in " + name + " DataMap or Key(" + obj + ")'s value is null.");
            }
        }
    }

    public boolean getBoolean(Object obj) {
    	
    	Boolean bar = true;
    	
        if (debug) {
            if (!super.containsKey(obj)) {
            }
        }

        ArrayList arr = (ArrayList)super.get(obj);

        if (arr != null) {
            Object obj1 = arr.get(0);
            if (obj1 == null) {
                if (nullToInitialize) {
                    return false;
                } else {
                    throw new RuntimeException("[Exception in DataMap] Key(" + obj + ") does not exist in " + name + " DataMap or Key(" + obj + ")'s value is null.");
                }
            } else {
                if (obj1.getClass().isInstance(bar)) return ((Boolean)obj1).booleanValue();
                if (obj1.getClass().isInstance("")) {
                    try {
                        return Boolean.getBoolean(obj1.toString());
                    } catch (Exception exception) {
                    }
                    throw new RuntimeException("[Exception in DataMap] Value Type(boolean) does not match : It's type is not boolean.");
                } else {
                    throw new RuntimeException("[Exception in DataMap] Value Type(boolean) does not match : It's type is not boolean.");
                }
            }
        } else {
            if (nullToInitialize) {
                return false;
            } else {
                throw new RuntimeException("[Exception in DataMap] Key(" + obj + ") does not exist in " + name + " DataMap or Key(" + obj + ")'s value is null.");
            }
        }
    }

    public String getString(Object obj) {
        if (debug) {
            if (!super.containsKey(obj)) {
            }
        }
        ArrayList arr = (ArrayList)super.get(obj);

        if (arr != null) {
            Object obj1 = arr.get(0);

            if (obj1 != null) {

                return replaceXss(obj1.toString());

            } else {
                if (nullToInitialize) return "";
                else return null;
            }
        } else {
            if (nullToInitialize) return "";
            else return null;
        }
    }

    public String replaceXss(String str) {
        String rtnVal = "";

        rtnVal = str.replaceAll("<", "&lt;");
        rtnVal = rtnVal.replaceAll(">", "&gt;");

        return rtnVal;

    }

    private Object getObj(Object obj, int i) {
        if (debug) {
            if (!super.containsKey(obj)) {
            }
        }

        Object obj1 = null;
        ArrayList arraylist = (ArrayList)super.get(obj);
        if (arraylist == null) {
            if (nullToInitialize) {
                return null;
            } else {
            }
        }

        try {
            obj1 = arraylist.get(i);
        } catch (IndexOutOfBoundsException indexoutofboundsexception) {
        }
        return obj1;
    }

    public Object get(Object obj, int i) {
        return getObj(obj, i);
    }

    public int getInt(Object obj, int i) {
        Object obj1 = getObj(obj, i);
        if (obj1 == null || obj1.toString().equals("")) return 0;
        Class class1 = obj1.getClass();
        if (class1 == java.lang.Integer.class) return ((Integer)obj1).intValue();
        if (class1 == java.lang.Short.class) return ((Short)obj1).shortValue();
        if (class1 == java.lang.String.class) {
            try {
                return Integer.parseInt(obj1.toString());
            } catch (Exception exception) {
            }
            throw new RuntimeException("[Exception in DataMap] Value of the Key(" + obj + ") Type(int) does not match : It's type is not int");
        } else {
            throw new RuntimeException("[Exception in DataMap] Value of the Key(" + obj + ") Type(int) does not match : It's type is not int");
        }
    }

    public double getDouble(Object obj, int i) {
        Object obj1 = getObj(obj, i);
        if (obj1 == null || obj1.toString().equals("")) return 0.0D;
        Class class1 = obj1.getClass();
        if (class1 == java.lang.Double.class) return ((Double)obj1).doubleValue();
        if (class1 == java.lang.Float.class) return (double)((Float)obj1).floatValue();
        if (class1 == java.lang.Integer.class) return (double)((Integer)obj1).intValue();
        if (class1 == java.lang.Long.class) return (double)((Long)obj1).longValue();
        if (class1 == java.lang.String.class) {
            try {
                return Double.parseDouble(obj1.toString());
            } catch (Exception exception) {
            }
            throw new RuntimeException("[Exception in DataMap] Value of the Key(" + obj + ") Type(double) does not match : It's type is not double");
        } else {
            throw new RuntimeException("[Exception in DataMap] Value of the Key(" + obj + ")  Type(double) does not match : It's type is not double");
        }
    }

    public float getFloat(Object obj, int i) {
        Object obj1 = getObj(obj, i);
        if (obj1 == null || obj1.toString().equals("")) return 0.0F;
        Class class1 = obj1.getClass();
        if (class1 == java.lang.Float.class) return ((Float)obj1).floatValue();
        if (class1 == java.lang.String.class) {
            try {
                return Float.parseFloat(obj1.toString());
            } catch (Exception exception) {
            }
            throw new RuntimeException("[Exception in DataMap] Value of the Key(" + obj + ") Type(float) does not match : It's type is not float");
        } else {
            throw new RuntimeException("[Exception in DataMap] Value of the Key(" + obj + ") Type(float) does not match : It's type is not float");
        }

    }

    public long getLong(Object obj, int i) {
        Object obj1 = getObj(obj, i);
        if (obj1 == null || obj1.toString().equals("")) return 0L;

        Class class1 = obj1.getClass();
        if (class1 == java.lang.Long.class) return ((Long)obj1).longValue();
        if (class1 == java.lang.Integer.class) return (long)((Integer)obj1).intValue();
        if (class1 == java.lang.Short.class) return (long)((Short)obj1).shortValue();
        if (class1 == java.lang.String.class) {
            try {
                return Long.parseLong(obj1.toString());
            } catch (Exception exception) {
            }
            throw new RuntimeException("[Exception in DataMap] Value of the Key(" + obj + ") Type(long) does not match : It's type is not long");
        } else {
            throw new RuntimeException("[Exception in DataMap] Value of the Key(" + obj + ") Type(long) does not match : It's type is not long");
        }
    }

    public short getShort(Object obj, int i) {
        Object obj1 = getObj(obj, i);
        if (obj1 == null || obj1.toString().equals("")) return 0;
        Class class1 = obj1.getClass();
        if (class1 == java.lang.Short.class) return ((Short)obj1).shortValue();
        if (class1 == java.lang.String.class) {
            try {
                return Short.parseShort(obj1.toString());
            } catch (Exception exception) {
                return 0;
            }

        } else {
            return 0;

        }
    }

    public boolean getBoolean(Object obj, int i) {
        Object obj1 = getObj(obj, i);
        if (obj1 == null) return false;
        Class class1 = obj1.getClass();

        if (class1 == java.lang.Boolean.class) {
            return ((Boolean)obj1).booleanValue();
        }

        if (class1 == java.lang.String.class) {
            try {
                return Boolean.getBoolean(obj1.toString());
            } catch (Exception exception) {
                return false;
            }
        } else {
            return false;
        }
    }

    public String getString(Object obj, int i) {
        Object obj1 = null;
        try {
            obj1 = getObj(obj, i);
        } catch (RuntimeException e) {
        } catch (Exception e) {
        }
        if (obj1 == null) {
            if (isNullToInitialize()) return "";
            else return null;
        } else {
            return obj1.toString();
        }
    }

    public Object[] toArray(Object obj) {
        if (debug) {
            if (!super.containsKey(obj)) {
            }
        }

        Object[] obj1 = null;
        ArrayList arraylist = (ArrayList)super.get(obj);
        if (arraylist == null) {
            if (nullToInitialize) {
                return null;
            } else {
            }
        }
        obj1 = arraylist.toArray();
        return obj1;
    }

    public Object[] toArray(Object obj, Object[] obj1) {
        if (debug) {
            if (!super.containsKey(obj)) {
            }
        }

        Object[] obj2 = null;
        ArrayList arraylist = (ArrayList)super.get(obj);
        if (arraylist == null) {
            if (nullToInitialize) {
                return null;
            } else {
            }
        }
        obj2 = arraylist.toArray(obj1);
        return obj2;
    }

    public Object remove(Object obj, int i) {
        if (super.containsKey(obj)) return ((ArrayList)super.get(obj)).remove(i);
        else return null;
    }

    public int keySize(Object obj) {
        if (super.containsKey(obj)) return ((ArrayList)super.get(obj)).size();
        else return 0;
    }

    public int keySize() {
        Set set = super.keySet();
        Iterator iterator = set.iterator();
        if (iterator.hasNext()) {
            String s = iterator.next().toString();
            return ((ArrayList)super.get(s)).size();
        } else {
            return 0;
        }
    }

    public synchronized String toString() {
        int i = super.size() - 1;
        StringBuffer stringbuffer = new StringBuffer();
        Set set = super.entrySet();
        Iterator iterator = set.iterator();
        stringbuffer.append("{");
        for (int j = 0; j <= i; j++) {
            Object obj = iterator.next();
            if (obj == null) stringbuffer.append("");
            else stringbuffer.append(obj.toString());
            if (j < i) stringbuffer.append(", ");
        }

        stringbuffer.append("}");
        return "DataMap[" + getName() + "]=" + stringbuffer.toString();
    }

}